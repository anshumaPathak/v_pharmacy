// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import '../../auth/register_screen.dart';
// import '../../repo/auth_repo.dart';
// import '../../utils/utils.dart';
// import 'login_view_model.dart';
//
// class VerifyOtpViewModel with ChangeNotifier {
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
//   // Future<void> verifyOtpApi(String phone, String otp, BuildContext context) async {
//   //   setLoading(true);
//   //
//   //   try {
//   //     final value = await _loginRepo.verifyOtpApi(phone, otp);
//   //     setLoading(false);
//   //
//   //     if (value['error'].toString() == "200") {
//   //       // ✅ Use mounted check before using context
//   //       if (context.mounted) Utils.show(value['msg'] ?? "OTP Verified", context);
//   //
//   //       final loginVM = Provider.of<LoginViewModel>(context, listen: false);
//   //       final response = await loginVM.loginApi(context, phone);
//   //
//   //       // ✅ Use Future.delayed to pop safely (wait till current frame completes)
//   //       Future.delayed(const Duration(milliseconds: 300), () {
//   //         if (context.mounted) {
//   //           Navigator.of(context, rootNavigator: true).pop();
//   //           // Navigator.pop(context);
//   //           // Navigator.pop(context);
//   //           // Navigator.pop(context);
//   //           // Navigator.of(context, rootNavigator: true).pop(); // close OTP dialog
//   //           // Navigator.of(context, rootNavigator: true).pop(); // close parent dialog if any
//   //         }
//   //       });
//   //     } else {
//   //       if (context.mounted) {
//   //         Utils.show(value['msg'] ?? "OTP Verification failed", context);
//   //       }
//   //     }
//   //   } catch (error) {
//   //     setLoading(false);
//   //     if (context.mounted) {
//   //       Utils.show("Something went wrong", context);
//   //     }
//   //   }
//   // }
//   Future<void> verifyOtpApi(String phone, String otp, BuildContext context) async {
//     setLoading(true);
//
//     try {
//       // 10-second timeout handle
//       final value = await _loginRepo.verifyOtpApi(phone, otp).timeout(
//         const Duration(seconds: 10),
//         onTimeout: () {
//           throw TimeoutException('Server not responding');
//         },
//       );
//
//       setLoading(false);
//
//       if (value['error'].toString() == "200") {
//         if (context.mounted) {
//           Utils.show(value['msg'] ?? "OTP Verified", context);
//         }
//
//         final loginVM = Provider.of<LoginViewModel>(context, listen: false);
//         await loginVM.loginApi(context, phone);
//
//         // ✅ Safely close the popup if it's still open
//         Navigator.pop(context);
//         Navigator.pop(context);
//         // if (Navigator.of(context, rootNavigator: true).canPop()) {
//         //
//         //   Navigator.of(context, rootNavigator: true).pop(); // close OTP popup
//         // }
//
//       } else {
//         if (context.mounted) {
//           Utils.show(value['msg'] ?? "OTP Verification failed", context);
//         }
//       }
//     } on TimeoutException {
//       setLoading(false);
//       if (context.mounted) {
//         Utils.show("Server taking too long. Try again later.", context);
//       }
//     } catch (error) {
//       setLoading(false);
//       if (context.mounted) {
//         Utils.show("Something went wrong. Please try again.", context);
//       }
//     }
//   }
//
// }
import 'dart:async';
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
      // Add timeout to prevent hanging API
      final value = await _loginRepo.verifyOtpApi(phone, otp).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException('Server not responding');
        },
      );

      setLoading(false);

      if (value['error'].toString() == "200") {
        if (context.mounted) {
          Utils.show(value['msg'] ?? "OTP Verified", context);
        }

        final loginVM = Provider.of<LoginViewModel>(context, listen: false);
        await loginVM.loginApi(context, phone);

        // ✅ Close popup dialogs safely
        if (context.mounted && Navigator.of(context, rootNavigator: true).canPop()) {
          Navigator.of(context, rootNavigator: true).pop(); // Close OTP popup
          Navigator.of(context, rootNavigator: true).pop(); // Close Login popup
        }
      } else {
        if (context.mounted) {
          Utils.show(value['msg'] ?? "OTP Verification failed", context);
        }
      }
    } on TimeoutException {
      setLoading(false);
      if (context.mounted) {
        Utils.show("Server taking too long. Try again later.", context);
      }
    } catch (error) {
      setLoading(false);
      if (context.mounted) {
        Utils.show("Something went wrong. Please try again.", context);
      }
    }
  }
}
