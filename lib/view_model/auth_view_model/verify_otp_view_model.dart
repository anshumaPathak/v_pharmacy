import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../auth/register_screen.dart';
import '../../repo/auth_repo.dart';
import '../../utils/routes/routes_name.dart';
import '../../utils/utils.dart';
import '../user_view_model.dart';

class VerifyOtpViewModel with ChangeNotifier {
  final _loginRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
  Future<void> verifyOtpApi(
      dynamic phone, dynamic otp, dynamic userid, bool isRegistered, BuildContext context) async {
    setLoading(true);
    _loginRepo.verifyOtpApi(phone, otp).then((value) {
      setLoading(false);
      if (value['error'].toString() == "200") {
        Utils.show(value['msg'] ?? "OTP Verified", context);
        if (isRegistered == true) {
          UserViewModel().saveUser(userid);
          print("UserID saved: $userid");
        } else {
          // User not registered → show registration dialog
          Future.delayed(const Duration(milliseconds: 300), () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => CompleteRegistrationDialog(
                phoneNumber: phone,
              ),
            );
          });
        }
      } else {
        Utils.show(value['msg'] ?? "OTP Verification failed", context);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('error: $error');
      }
      Utils.show(error.toString(), context);
    });
  }
}
