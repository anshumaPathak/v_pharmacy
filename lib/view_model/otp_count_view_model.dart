// import 'package:flutter/foundation.dart';
// import '../repo/otp_count_repo.dart';
//
// class OtpCountViewModel with ChangeNotifier {
//   final _repo = OtpCountRepository();
//
//   bool _loading = false;
//   bool get loading => _loading;
//
//   setLoading(bool value) {
//     _loading = value;
//     notifyListeners();
//   }
//
//
//   Future<void> otpCountApi() async {
//     setLoading(true);
//     _repo.otpCountApi().then((value) {
//       setLoading(false);
//     }).onError((error, stackTrace) {
//       setLoading(false);
//       if (kDebugMode) {
//         print('error: $error');
//       }
//     });
//   }
// }
import 'package:flutter/foundation.dart';
import '../repo/otp_count_repo.dart';

class OtpCountViewModel with ChangeNotifier {
  final _repo = OtpCountRepository();

  bool _loading = false;
  bool get loading => _loading;

  int _otpCount = 0;
  int get otpCount => _otpCount;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<bool> otpCountApi() async {
    setLoading(true);
    bool canSend = false;

    await _repo.otpCountApi().then((value) {
      setLoading(false);
      if (value['status'] == true && value['otp_count'] > 0) {
        _otpCount = value['otp_count'];
        canSend = true;
      } else {
        _otpCount = 0;
        canSend = false;
      }
      notifyListeners();
    }).onError((error, stackTrace) {
      setLoading(false);
      canSend = false;
      if (kDebugMode) print('error: $error');
    });

    return canSend;
  }
}
