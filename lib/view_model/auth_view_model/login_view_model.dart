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
  Future<void> loginApi(BuildContext context, dynamic phone) async {
    setLoading(true);
    final data = {"mobile": phone};
    print("📞 Sending login API with data: $data");

    await _loginRepo.loginApi(data).then((response) {
      print("✅ Response: $response");

      setLoading(false);

      if (response['success'] == true) {
        final message = "OTP sent successfully";

        // API se register_status aur userId fetch karein
        final isRegistered = response['register_status'] == 1;
        final userId = response['id']?.toString() ?? '';

        // Show OTP dialog
        Future.delayed(const Duration(milliseconds: 300), () {
          if (context.mounted) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => OTPVerificationDialog(
                phoneNumber: phone.toString(),
                userId: userId,
                isRegistered: isRegistered, // ✅ yaha dynamic
              ),
            );
          }
        });

        Utils.show(message, context);
      } else {
        // OTP phir bhi bhejna hai, user not registered
        Future.delayed(const Duration(milliseconds: 300), () {
          if (context.mounted) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => OTPVerificationDialog(
                phoneNumber: phone.toString(),
                userId: "",
                isRegistered: false, // ✅ yaha dynamic false
              ),
            );
          }
        });

        Utils.show(response['message'] ?? "Something went wrong", context);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      debugPrint("🚨 Error in loginApi: $error");
      Utils.show("Server error, please try again later", context);
    });
  }

}
