// import 'package:flutter/material.dart';
// import '../../auth/register_screen.dart';
// import '../../repo/auth_repo.dart';
// import '../../utils/utils.dart';
// import '../user_view_model.dart';
//
// class LoginViewModel with ChangeNotifier {
//   final TextEditingController phoneController = TextEditingController();
//   final _loginRepo = AuthRepository();
//
//   bool _loading = false;
//   bool get loading => _loading;
//
//   void setLoading(bool value) {
//     _loading = value;
//     notifyListeners();
//   }
//
//   Future<Map<String, dynamic>> loginApi(BuildContext context, String phone) async {
//     setLoading(true);
//     final data = {"mobile": phone};
//
//     try {
//       final response = await _loginRepo.loginApi(data);
//       setLoading(false);
//
//       // Agar user registered hai
//       if (response['register_status'] == 1) {
//         Utils.show(response['message'] ?? "Login successful", context);
//
//         // ✅ Save user ID for future API calls
//         final userId = response['id']?.toString();
//         if (userId != null && userId.isNotEmpty) {
//           await UserViewModel().saveUser(userId);
//         }
//
//       }
//       else if (response['register_status'] == 1) {
//         Utils.show(response['message'] ?? "Mobile not registered", context);
//
//         // ✅ Show register popup
//         if (context.mounted) {
//           showDialog(
//             context: context,
//             barrierDismissible: false,
//             builder: (_) => CompleteRegistrationDialog(phoneNumber: phone),
//           );
//         }
//       }
//
//       return response;
//     } catch (error) {
//       setLoading(false);
//       print("🚨 Login error: $error");
//
//       // Agar 404 ya kisi aur error me mobile not registered
//       if (context.mounted) {
//         showDialog(
//           context: context,
//           barrierDismissible: false,
//           builder: (_) => CompleteRegistrationDialog(phoneNumber: phone),
//         );
//       }
//
//       return {"register_status": 0, "message": "Mobile not registered"};
//     }
//   }
//
// }
//
import 'package:flutter/material.dart';
import '../../auth/register_screen.dart';
import '../../repo/auth_repo.dart';
import '../../utils/utils.dart';
import '../user_view_model.dart';

class LoginViewModel with ChangeNotifier {
  final TextEditingController phoneController = TextEditingController();
  final _loginRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  // Future<Map<String, dynamic>> loginApi(BuildContext context, String phone) async {
  //   setLoading(true);
  //   final data = {"mobile": phone};
  //
  //   try {
  //     final response = await _loginRepo.loginApi(data);
  //     setLoading(false);
  //
  //     // ✅ Check if user is blocked by admin (status: 0)
  //     if (response['status'] == 0) {
  //       if (context.mounted) {
  //         showDialog(
  //           context: context,
  //           barrierDismissible: false,
  //           builder: (_) => AlertDialog(
  //             title: const Text('Account Blocked'),
  //             content: Text(response['message'] ?? 'Your account has been blocked by admin'),
  //             actions: [
  //               TextButton(
  //                 onPressed: () => Navigator.of(context).pop(),
  //                 child: const Text('OK'),
  //               ),
  //             ],
  //           ),
  //         );
  //       }
  //       return response;
  //     }
  //
  //     // ✅ Agar user registered hai
  //     if (response['register_status'] == 1) {
  //       Utils.show(response['message'] ?? "Login successful", context);
  //
  //       // ✅ Save user ID for future API calls
  //       final userId = response['id']?.toString();
  //       if (userId != null && userId.isNotEmpty) {
  //         await UserViewModel().saveUser(userId);
  //       }
  //     }
  //     // ✅ Agar user registered nahi hai
  //     else if (response['register_status'] == 0) {
  //       Utils.show(response['message'] ?? "Mobile not registered", context);
  //
  //       // ✅ Show register popup
  //       if (context.mounted) {
  //         showDialog(
  //           context: context,
  //           barrierDismissible: false,
  //           builder: (_) => CompleteRegistrationDialog(phoneNumber: phone),
  //         );
  //       }
  //     }
  //
  //     return response;
  //   } catch (error) {
  //     setLoading(false);
  //     print("🚨 Login error: $error");
  //
  //     if (context.mounted) {
  //       showDialog(
  //         context: context,
  //         barrierDismissible: false,
  //         builder: (_) => CompleteRegistrationDialog(phoneNumber: phone),
  //       );
  //     }
  //
  //     return {"register_status": 0, "message": "Mobile not registered"};
  //   }
  // }
  Future<Map<String, dynamic>> loginApi(BuildContext context, String phone) async {
    setLoading(true);
    final data = {"mobile": phone};

    try {
      final response = await _loginRepo.loginApi(data);
      setLoading(false);

      // Normal flow for registered / not registered users
      if (response['status'] == 0 && response['register_status'] == 0) {
        if (context.mounted) {
          await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => AlertDialog(
              title: const Text('Account Blocked'),
              content: Text(response['message'] ?? 'Your account has been blocked by admin. Please contact admin.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
        return response;
      }

      if (response['register_status'] == 1) {
        Utils.show(response['message'] ?? "Login successful", context);

        final userId = response['id']?.toString();
        if (userId != null && userId.isNotEmpty) {
          await UserViewModel().saveUser(userId);
        }
      } else if (response['register_status'] == 0) {
        Utils.show(response['message'] ?? "Mobile not registered", context);

        // if (context.mounted) {
        //   await showDialog(
        //     context: context,
        //     barrierDismissible: false,
        //     builder: (_) => CompleteRegistrationDialog(phoneNumber: phone),
        //   );
        // }
      }

      return response;
    } catch (error) {
      setLoading(false);
      // print("🚨 Login error: $error");

      // ✅ Handle 403 blocked account error
      if (error.toString().contains('403') || error.toString().contains('RequestForbidden')) {
        if (context.mounted) {
          await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => AlertDialog(
              title: const Text('Account Blocked'),
              content: const Text('Your account is blocked by admin. Please contact admin.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
        return {"status": 0, "register_status": 0, "message": "Your account is blocked by admin"};
      }

      // Default registration popup for other errors
      if (context.mounted) {
        await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => CompleteRegistrationDialog(phoneNumber: phone),
        );
      }

      return {"register_status": 0, "message": "Mobile not registered"};
    }
  }

}