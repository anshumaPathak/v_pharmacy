import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:v_pharmashing/utils/routes/routes_name.dart';
import '../../repo/auth_repo.dart';
import '../../utils/utils.dart';
import '../profile_view_model.dart';
import '../user_view_model.dart';

class RegisterViewModel with ChangeNotifier {
  final _loginRepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
  // Future<void> registerApi(dynamic name, dynamic email, dynamic mobile, BuildContext context) async {
  //   setLoading(true);
  //   Map<String, dynamic> data = {
  //     "name": name,
  //     "email": email,
  //     "mobile": mobile
  //   };
  //   print(data);
  //
  //   try {
  //     final value = await _loginRepo.registerApi(data);
  //     if (value['success'] == true) {
  //       // ✅ Save user login info locally
  //       UserViewModel userViewModel = UserViewModel();
  //       await userViewModel.saveUser(value['id'].toString());
  //
  //       final sp = await SharedPreferences.getInstance();
  //       await sp.setString('user_name', name);
  //       await sp.setBool('is_logged_in', true);
  //
  //       // Close any open dialogs before navigating
  //       if (Navigator.canPop(context)) {
  //         Navigator.pop(context); // Close registration dialog
  //         Navigator.pop(context); // Close registration dialog
  //         Navigator.pop(context); // Close registration dialog
  //       }
  //
  //       Utils.show(value['message'], context);
  //
  //       // Navigate to dashboard or home screen
  //       // context.pushReplacementNamed(context, RoutesName.dashboardScreen);
  //
  //       String? userId = await userViewModel.getUser();
  //       print("User Registered - User ID: $userId");
  //
  //     } else {
  //       Utils.show(value['message'], context);
  //       print("Error Message: ${value['message']}");
  //       if (value['message'] == "Email already exists") {
  //         Utils.show("Email has already been taken", context);
  //       }
  //     }
  //   } catch (error) {
  //     if (kDebugMode) {
  //       print('Error: $error');
  //     }
  //     Utils.show("Something went wrong. Please try again later.", context);
  //   } finally {
  //     setLoading(false);
  //   }
  // }
  Future<void> registerApi(
      String name,
      String email,
      String mobile,
      BuildContext context,
      ) async {
    setLoading(true);

    final data = {
      "name": name,
      "email": email,
      "mobile": mobile,
    };
    print("Register Data: $data");

    try {
      final value = await _loginRepo.registerApi(data);
      print("Register Response: $value");

      if (value['id'] != null) {
        final userId = value['id'].toString();

        // 1️⃣ Save user ID
        final userViewModel = UserViewModel();
        await userViewModel.saveUser(userId);
        print("User Registered - User ID: $userId");

        // 2️⃣ Save additional info in SharedPreferences
        final sp = await SharedPreferences.getInstance();
        await sp.setString('user_name', name);
        await sp.setBool('is_logged_in', true);

        // 3️⃣ Safely use context
        if (context.mounted) {
          Navigator.of(context, rootNavigator: true).pop();
          Navigator.pop(context);// Close dialog
          Utils.show(value['message'] ?? "User registered successfully", context);

          // 4️⃣ Call profile API now that user ID is saved
          final savedUserId = await userViewModel.getUser();
          print("Saved User ID before profile API: $savedUserId");
          if (savedUserId != null && savedUserId.isNotEmpty) {
            await Provider.of<ProfileViewModel>(context, listen: false)
                .profileApi(context);
          } else {
            print("🚨 User ID not found. Cannot call profile API.");
          }
        }

      } else {
        final errorMsg = (value['message'] == "Email already exists")
            ? "Email has already been taken"
            : value['message'] ?? "Registration failed";

        if (context.mounted) Utils.show(errorMsg, context);
        print("Error Message: ${value['message']}");
      }

    } catch (error) {
      print('Register API Error: $error');
      if (context.mounted) {
        Utils.show("Something went wrong. Please try again later.", context);
      }
    } finally {
      setLoading(false);
    }
  }





// Future<void> registerApi(dynamic name, dynamic email, dynamic mobile, context) async {
  //   setLoading(true);
  //   Map<String, dynamic> data = {
  //     "name": name,
  //     "email": email,
  //     "mobile": mobile
  //   };
  //   print(data);
  //
  //   try {
  //     final value = await _loginRepo.registerApi(data);
  //     if (value['success'] == true) {
  //       // ✅ Save user login info locally
  //       UserViewModel userViewModel = UserViewModel();
  //       userViewModel.saveUser(value['id'].toString());
  //
  //       final sp = await SharedPreferences.getInstance();
  //       await sp.setString('user_name', name);
  //       await sp.setBool('is_logged_in', true);
  //
  //       Utils.show(value['message'], context);
  //       // context.pop();
  //     // Navigator.pushNamed(context, RoutesName.dashboardScreen);
  //
  //       String? userId = await userViewModel.getUser();
  //       print("User Registered - User ID: $userId");
  //
  //     } else {
  //       Utils.show(value['message'], context);
  //       print("Error Message: ${value['message']}");
  //       if (value['message'] == "Email already exists") {
  //         Utils.show("Email has already been taken", context);
  //       } else {
  //         Utils.show(value['message'], context);
  //       }
  //     }
  //   } catch (error) {
  //     if (kDebugMode) {
  //       print('Error: $error');
  //     }
  //     Utils.show("Something went wrong. Please try again later.", context);
  //   } finally {
  //     setLoading(false);
  //   }
  // }
}
