// // import 'dart:convert';
// // import 'dart:io';
// //
// // import 'package:flutter/material.dart';
// //
// // import '../../auth/otp_screen.dart';
// // import '../../repo/auth_repo.dart';
// // import '../../utils/utils.dart';
// //
// // class LoginViewModel with ChangeNotifier {
// //   final TextEditingController phoneController = TextEditingController();
// //
// //   final _loginRepo = AuthRepository();
// //   bool _loading = false;
// //
// //   bool get loading => _loading;
// //
// //   void setLoading(bool value) {
// //     _loading = value;
// //     notifyListeners();
// //   }
// //   Future<void> loginApi(BuildContext context, dynamic phone) async {
// //     setLoading(true);
// //     final data = {"mobile": phone};
// //     print("📞 Sending login API with data: $data");
// //
// //     await _loginRepo.loginApi(data).then((response) {
// //       print("✅ Response: $response");
// //
// //       setLoading(false);
// //
// //       if (response['success'] == true) {
// //         final message = "OTP sent successfully";
// //
// //         final isRegistered = response['register_status'] == 1;
// //         final userId = response['id']?.toString() ?? '';
// //
// //         // Show OTP dialog
// //         Future.delayed(const Duration(milliseconds: 300), () {
// //           if (context.mounted) {
// //             showDialog(
// //               context: context,
// //               barrierDismissible: false,
// //               builder: (context) => OTPVerificationDialog(
// //                 phoneNumber: phone.toString(),
// //                 userId: userId,
// //                 isRegistered: isRegistered,
// //               ),
// //             );
// //           }
// //         });
// //
// //         Utils.show(message, context);
// //       } else {
// //         Future.delayed(const Duration(milliseconds: 300), () {
// //           if (context.mounted) {
// //             showDialog(
// //               context: context,
// //               barrierDismissible: false,
// //               builder: (context) => OTPVerificationDialog(
// //                 phoneNumber: phone.toString(),
// //                 userId: "",
// //                 isRegistered: false,
// //               ),
// //             );
// //           }
// //         });
// //
// //         Utils.show(response['message'] ?? "Something went wrong", context);
// //       }
// //     }).onError((error, stackTrace) {
// //       setLoading(false);
// //       debugPrint("🚨 Error in loginApi: $error");
// //       Utils.show("Server error, please try again later", context);
// //     });
// //   }
// //
// // }
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import '../../auth/register_screen.dart';
// import '../../repo/auth_repo.dart';
// import '../../utils/utils.dart';
// import '../../utils/routes/routes_name.dart';
// import '../user_view_model.dart'; // For saving user data
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
//   // Future<void> loginApi(BuildContext context, dynamic phone) async {
//   //   setLoading(true);
//   //   final data = {"mobile": phone};
//   //   print("📞 Sending login API with data: $data");
//   //
//   //   try {
//   //     final response = await _loginRepo.loginApi(data);
//   //     print("✅ Response: $response");
//   //
//   //     setLoading(false);
//   //
//   //     // ✅ Handle successful login
//   //     if (response['message'] == "User logged in successfully" ||
//   //         response['register_status'] == 1) {
//   //       final userId = response['id']?.toString() ?? '';
//   //       print("✅ User logged in with ID: $userId");
//   //
//   //       // ✅ Save user info globally (UserViewModel)
//   //       if (userId.isNotEmpty) {
//   //         UserViewModel().saveUser(userId);
//   //       }
//   //
//   //       Utils.show(response['message'] ?? "Login successful", context);
//   //
//   //       // ✅ Navigate to Home or Profile Page
//   //       // Future.delayed(const Duration(milliseconds: 400), () {
//   //       //   if (context.mounted) {
//   //       //     Navigator.pushNamedAndRemoveUntil(
//   //       //       context,
//   //       //       RoutesName.home, // Change to your main screen route
//   //       //           (route) => false,
//   //       //     );
//   //       //   }
//   //       // });
//   //     }
//   //     // ✅ If OTP send phase (first step)
//   //     else if (response['error'] == "200") {
//   //       Utils.show(response['msg'] ?? "OTP sent successfully", context);
//   //     }
//   //     // ❌ Any other error
//   //     else {
//   //       Utils.show(response['message'] ?? "Something went wrong", context);
//   //     }
//   //
//   //   } catch (error) {
//   //     setLoading(false);
//   //     debugPrint("🚨 Error in loginApi: $error");
//   //     Utils.show("Server error, please try again later", context);
//   //   }
//   // }
//   Future<void> loginApi(BuildContext context, dynamic phone) async {
//     setLoading(true);
//     final data = {"mobile": phone};
//     print("📞 Sending login API with data: $data");
//     try {
//       final response = await _loginRepo.loginApi(data);
//       setLoading(false);
//
//       if (response['message'] == "User logged in successfully" || response['register_status'] == 1) {
//         // Successful login
//       } else if (response['register_status'] == 0) {
//         // Navigate to register
//         Utils.show(response['message'] ?? "Mobile not registered", context);
//         if (context.mounted) {
//           showDialog(
//             context: context,
//             barrierDismissible: false,
//             builder: (_) => CompleteRegistrationDialog(phoneNumber: phone),
//           );        }
//       }
//     } catch (error) {
//       setLoading(false);
//
//       try {
//         final body = jsonDecode(error.toString());
//         if (body['register_status'] == 0) {
//           Utils.show(body['message'], context);
//           if (context.mounted) {
//             showDialog(
//               context: context,
//               barrierDismissible: false,
//               builder: (_) => CompleteRegistrationDialog(phoneNumber: phone),
//             );          }
//           return;
//         }
//       } catch (_) {}
//
//       Utils.show("Server error, please try again later", context);
//     }
//
//
//   }
//
// }
import 'dart:convert';
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

  // ✅ Return Map for OTP handler
  // Future<Map<String, dynamic>> loginApi(BuildContext context, String phone) async {
  //   setLoading(true);
  //   final data = {"mobile": phone};
  //   print("📞 Sending login API with data: $data");
  //
  //   try {
  //     final response = await _loginRepo.loginApi(data);
  //     print("✅ Response: $response");
  //     setLoading(false);
  //
  //     if (response['message'] == "User logged in successfully" ||
  //         response['register_status'] == 1) {
  //       final userId = response['id']?.toString() ?? '';
  //       if (userId.isNotEmpty) UserViewModel().saveUser(userId);
  //       Utils.show(response['message'] ?? "Login successful", context);
  //     }
  //     // Mobile not registered
  //     else if (response['register_status'] == 0) {
  //       Utils.show(response['message'] ?? "Mobile not registered", context);
  //     }
  //
  //     return response;
  //   } catch (error) {
  //     setLoading(false);
  //     Utils.show("Server error, please try again later", context);
  //     return {"register_status": -1}; // fallback
  //   }
  // }
  Future<Map<String, dynamic>> loginApi(BuildContext context, String phone) async {
    setLoading(true);
    final data = {"mobile": phone};

    try {
      final response = await _loginRepo.loginApi(data);
      setLoading(false);

      // Agar user registered hai
      if (response['register_status'] == 1) {
        Utils.show(response['message'] ?? "Login successful", context);

        // ✅ Save user ID for future API calls
        final userId = response['id']?.toString();
        if (userId != null && userId.isNotEmpty) {
          await UserViewModel().saveUser(userId);
        }

        // ✅ Optional: call profile API after login
        // await Provider.of<ProfileViewModel>(context, listen: false).profileApi(context);
      }
      // Agar user NOT registered
      else if (response['register_status'] == 0) {
        Utils.show(response['message'] ?? "Mobile not registered", context);

        // ✅ Show register popup
        if (context.mounted) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => CompleteRegistrationDialog(phoneNumber: phone),
          );
        }
      }

      return response;
    } catch (error) {
      setLoading(false);
      print("🚨 Login error: $error");

      // Agar 404 ya kisi aur error me mobile not registered
      if (context.mounted) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => CompleteRegistrationDialog(phoneNumber: phone),
        );
      }

      return {"register_status": 0, "message": "Mobile not registered"};
    }
  }

}

