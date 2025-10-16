import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  // Future<void> profileApi(BuildContext context) async {
  //   UserViewModel userViewModel = UserViewModel();
  //   String? userId = await userViewModel.getUser();
  //
  //   if (userId == null || userId.isEmpty) {
  //     print("🚨 User ID not found. Cannot call profile API.");
  //     _isLoggedIn = false;
  //     _userName = null;
  //     notifyListeners();
  //     return;
  //   }
  //
  //   setLoading(true);
  //   Map<String, dynamic> data = {"user_id": userId};
  //   print("Profile API Call: $data");
  //
  //   try {
  //     final value = await _profileRepo.profileApi(data);
  //     print("Profile Response: $value");
  //
  //     if (value['data'] != null) {
  //       _userName = value['data']['name'] ?? "User";
  //       _isLoggedIn = true;
  //     } else {
  //       _isLoggedIn = false;
  //       _userName = null;
  //     }
  //
  //     notifyListeners();
  //   } catch (error) {
  //     if (kDebugMode) print('Profile API Error: $error');
  //     _isLoggedIn = false;
  //     _userName = null;
  //     notifyListeners();
  //   } finally {
  //     setLoading(false);
  //   }
  // }
  Future<void> profileApi(BuildContext context) async {
    UserViewModel userViewModel = UserViewModel();
    String? userId = await userViewModel.getUser();

    if (userId == null || userId.isEmpty) {
      print("🚨 User ID not found. Cannot call profile API.");
      _isLoggedIn = false;
      _userName = null;
      notifyListeners();
      return;
    }

    setLoading(true);
    Map<String, dynamic> data = {"user_id": userId};
    print("Profile API Call: $data");

    try {
      final value = await _profileRepo.profileApi(data);
      print("Profile Response: $value");

      if (value['data'] != null) {
        int status = value['data']['status'] ?? 1; // default 1 if null
        _userName = value['data']['name'] ?? "User";

        if (status == 0) {
          _isLoggedIn = false;
          _userName = null;
          notifyListeners();

          // Show blocked popup
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Blocked"),
              content: const Text("Your account is blocked by admin. Please contact admin."),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    logout(); // remove user id and reset state
                  },
                  child: const Text("OK"),
                ),
              ],
            ),
          );
          return; // stop further execution
        } else {
          _isLoggedIn = true;
        }
      } else {
        _isLoggedIn = false;
        _userName = null;
      }

      notifyListeners();
    } catch (error) {
      if (kDebugMode) print('Profile API Error: $error');
      _isLoggedIn = false;
      _userName = null;
      notifyListeners();
    } finally {
      setLoading(false);
    }
  }

  Future<void> logout() async {
    final sp = await SharedPreferences.getInstance();

    // User ID remove karo
    await sp.remove('user_id');

    // State reset
    _isLoggedIn = false;
    _userName = null;
    notifyListeners();
  }

}
