import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:v_pharmashing/repo/profile_repo.dart';
import 'package:v_pharmashing/view_model/user_view_model.dart';
import '../../utils/utils.dart';

class ProfileViewModel with ChangeNotifier {
  final _profileRepo = ProfileRepository();
  bool _loading = false;
  bool _isLoggedIn = false;
  String? _userName;

  bool get loading => _loading;
  bool get isLoggedIn => _isLoggedIn;
  String? get userName => _userName;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> profileApi(BuildContext context) async {
    UserViewModel userViewModel = UserViewModel();
    String? userId = await userViewModel.getUser();

    setLoading(true);
    Map<String, dynamic> data = {"user_id": userId};
    print("Profile API Call: $data");

    try {
      final value = await _profileRepo.profileApi(data);
      print("Profile Response: $value");

      if (value['success'] == true && value['data'] != null) {
        _userName = value['data']['name'];
        _isLoggedIn = true;
      } else {
        _isLoggedIn = false;
        _userName = null;
      }
      notifyListeners();
    } catch (error) {
      if (kDebugMode) {
        print('Profile API Error: $error');
      }
      _isLoggedIn = false;
      _userName = null;
      Utils.show("Something went wrong.", context);
      notifyListeners();
    } finally {
      setLoading(false);
    }
  }

  void logout() {
    _isLoggedIn = false;
    _userName = null;
    notifyListeners();
  }
}
