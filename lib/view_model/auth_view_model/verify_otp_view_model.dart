// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:provider/provider.dart';
//
// import '../../auth/register_screen.dart';
// import '../../repo/auth_repo.dart';
// import '../../utils/routes/routes_name.dart';
// import '../../utils/utils.dart';
// import '../user_view_model.dart';
//
// class VerifyOtpViewModel with ChangeNotifier {
//   final _loginRepo = AuthRepository();
//
//   bool _loading = false;
//   bool get loading => _loading;
//
//   setLoading(bool value) {
//     _loading = value;
//     notifyListeners();
//   }
//   Future<void> verifyOtpApi(
//       dynamic phone,
//       dynamic otp,
//       dynamic userid,
//       bool isRegistered,
//       BuildContext context,
//       ) async {
//     setLoading(true);
//
//     try {
//       final value = await _loginRepo.verifyOtpApi(phone, otp);
//       setLoading(false);
//
//       if (value['error'].toString() == "200") {
//         Utils.show(value['msg'] ?? "OTP Verified", context);
//
//         // if (isRegistered) {
//         //   // Already registered
//         //   if (userid.isNotEmpty) UserViewModel().saveUser(userid);
//         //
//         //   showDialog(
//         //     context: context,
//         //     barrierDismissible: false,
//         //     builder: (_) => AlreadyRegisteredDialog(phoneNumber: phone),
//         //   );
//         // }
//         // else {
//         //   showDialog(
//         //     context: context,
//         //     barrierDismissible: false,
//         //     builder: (_) => CompleteRegistrationDialog(phoneNumber: phone),
//         //   );
//         // }
//       } else {
//         showDialog(
//           context: context,
//           barrierDismissible: false,
//           builder: (_) => CompleteRegistrationDialog(phoneNumber: phone),
//         );
//         Utils.show(value['msg'] ?? "OTP Verification failed", context);
//       }
//     } catch (error) {
//       setLoading(false);
//       Utils.show("Something went wrong", context);
//     }
//   }
//
// }
//
// class AlreadyRegisteredDialog extends StatelessWidget {
//   final String phoneNumber;
//
//   const AlreadyRegisteredDialog({super.key, required this.phoneNumber});
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: const Text("Welcome Back!"),
//       content: Text("User $phoneNumber already registered.\nPlease proceed to login."),
//       actions: [
//         TextButton(
//           onPressed: () {
//             Navigator.pop(context);
//             Navigator.pop(context);
//           },
//           child: const Text("OK"),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../auth/register_screen.dart';
import '../../repo/auth_repo.dart';
import '../../utils/utils.dart';
import 'login_view_model.dart';

class VerifyOtpViewModel with ChangeNotifier {
  final _loginRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
  Future<void> verifyOtpApi(String phone, String otp, BuildContext context) async {
    setLoading(true);

    try {
      final value = await _loginRepo.verifyOtpApi(phone, otp);
      setLoading(false);

      if (value['error'].toString() == "200") {
        Utils.show(value['msg'] ?? "OTP Verified", context);

        final loginVM = Provider.of<LoginViewModel>(context, listen: false);
        final response = await loginVM.loginApi(context, phone);
       Navigator.pop(context);
       Navigator.pop(context);
        // if (response['register_status'] == 0) {
        //   showDialog(
        //     context: context,
        //     barrierDismissible: false,
        //     builder: (_) => CompleteRegistrationDialog(phoneNumber: phone),
        //   );
        // }
      } else {
        // Utils.show(value['msg'] ?? "OTP Verification failed", context);
      }
    } catch (error) {
      setLoading(false);
      Utils.show("Something went wrong", context);

      // Agar koi unexpected error bhi aaye → Register popup
      // if (context.mounted) {
      //   showDialog(
      //     context: context,
      //     barrierDismissible: false,
      //     builder: (_) => CompleteRegistrationDialog(phoneNumber: phone),
      //   );
      // }
    }
  }

}
