// import 'package:flutter/foundation.dart';
//
// import '../../repo/auth_repo.dart';
// import '../../utils/utils.dart';
// class SendOtpViewModel with ChangeNotifier {
//   final _sendOtpRepo = AuthRepository();
//
//   bool _loading = false;
//   bool get loading => _loading;
//
//   setLoading(bool value) {
//     _loading = value;
//     notifyListeners();
//   }
//   Future<void> sendOtpApi(dynamic mobile, context) async {
//     setLoading(true);
//     _sendOtpRepo.sendOtpApi(mobile).then((value) {
//       if (value['error'] == 200) {
//         Utils.show(value['msg'], context);
//         setLoading(false);
//       }
//       else {
//         setLoading(false);
//       }
//     }).onError((error, stackTrace) {
//       setLoading(false);
//       if (kDebugMode) {
//         print('error: $error');
//       }
//     });
//   }
// }

import 'package:flutter/foundation.dart';
import '../../repo/auth_repo.dart';
import '../../utils/utils.dart';
import '../otp_count_view_model.dart';

class SendOtpViewModel with ChangeNotifier {
  final _sendOtpRepo = AuthRepository();
  final OtpCountViewModel otpCountViewModel = OtpCountViewModel();

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> sendOtpApi(dynamic mobile, context) async {
    setLoading(true);

    // 🔹 Pehle OTP count check karo
    bool canSendOtp = await otpCountViewModel.otpCountApi();

    if (!canSendOtp) {
      // Agar count 0 hai to send OTP API mat chalao
      // Utils.show("OTP not send", context);
      setLoading(false);
      return;
    }

    // 🔹 Agar count > 0 hai tabhi send OTP API chalao
    _sendOtpRepo.sendOtpApi(mobile).then((value) {
      if (value['error'] == 200) {
        Utils.show(value['msg'], context);
      } else {
        // Utils.show("Failed to send OTP", context);
      }
      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) print('error: $error');
    });
  }
}
