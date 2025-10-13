import 'package:flutter/foundation.dart';

import '../../repo/auth_repo.dart';
import '../../utils/utils.dart';
class SendOtpViewModel with ChangeNotifier {
  final _sendOtpRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
  Future<void> sendOtpApi(dynamic mobile, context) async {
    setLoading(true);
    _sendOtpRepo.sendOtpApi(mobile).then((value) {
      if (value['error'] == 200) {
        Utils.show(value['msg'], context);
        setLoading(false);
      }
      else {
        setLoading(false);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }
}