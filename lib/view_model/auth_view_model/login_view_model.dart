import 'package:flutter/material.dart';

import '../../auth/otp_screen.dart';
import '../../repo/auth_repo.dart';
import '../../utils/utils.dart';

class LoginViewModel with ChangeNotifier {
  final TextEditingController phoneController = TextEditingController();

  final _loginRepo = AuthRepository();
  bool _loading = false;

  bool get loading => _loading;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
  // Future<void> loginApi(BuildContext context, dynamic phone) async {
  //   void _showOTPDialog() {
  //     showDialog(
  //       context: context,
  //       barrierDismissible: false,
  //       builder: (context) => OTPVerificationDialog(
  //         phoneNumber: phone.toString(),
  //       ),
  //     );
  //   }
  //
  //   setLoading(true);
  //   final data = {"mobile": phone};
  //   print("📞 Sending login API with data: $data");
  //
  //   await _loginRepo.loginApi(data).then((response) {
  //     print("✅ Response: $response");
  //
  //     if (response['success'] == true) {
  //       final message = response['message'] ?? "OTP sent successfully";
  //
  //       // ✅ Ensure dialog opens after UI is ready
  //       Future.delayed(const Duration(milliseconds: 300), () {
  //         if (context.mounted) _showOTPDialog();
  //       });
  //
  //       Utils.show(message, context);
  //       setLoading(false);
  //     } else {
  //       Utils.show(response['message'] ?? "Something went wrong", context);
  //       setLoading(false);
  //     }
  //   }).onError((error, stackTrace) {
  //     setLoading(false);
  //     debugPrint("🚨 Error in loginApi: $error");
  //     Utils.show("Server error, please try again later", context);
  //   });
  // }
  Future<void> loginApi(BuildContext context, dynamic phone) async {
    setLoading(true);
    final data = {"mobile": phone};
    print("📞 Sending login API with data: $data");

    await _loginRepo.loginApi(data).then((response) {
      print("✅ Response: $response");

      if (response['success'] == true) {
        final message = response['message'] ?? "OTP sent successfully";
        final isRegistered = response['register_status'] == 1;
        final userId = response['id'].toString();

        // Show OTP dialog
        Future.delayed(const Duration(milliseconds: 300), () {
          if (context.mounted) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => OTPVerificationDialog(
                phoneNumber: phone.toString(),
                userId: userId,
                isRegistered: isRegistered,
              ),
            );
          }
        });

        Utils.show(message, context);
        setLoading(false);
      } else {
        Utils.show(response['message'] ?? "Something went wrong", context);
        setLoading(false);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      debugPrint("🚨 Error in loginApi: $error");
      Utils.show("Server error, please try again later", context);
    });
  }

}
