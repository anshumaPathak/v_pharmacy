// import 'package:flutter/foundation.dart';
// import '../../repo/auth_repo.dart';
// import '../../utils/utils.dart';
// import '../user_view_model.dart';
//
//
// class RegisterViewModel with ChangeNotifier {
//   final _loginRepo = AuthRepository();
//   bool _loading = false;
//   bool get loading => _loading;
//   setLoading(bool value) {
//     _loading = value;
//     notifyListeners();
//   }
//
//   Future<void> registerApi(dynamic name,dynamic email, dynamic mobile,context) async {
//
//     // final loginV=Provider.of<LoginViewModel>(context,listen: false);
//     // UserViewModel userViewModel = UserViewModel();
//     setLoading(true);
//     Map<String, dynamic> data = {
//       "name":name,
//       "email": email,
//       "mobile":mobile
//     };
// print(data);
//     try {
//       final value = await _loginRepo.registerApi(data);
//       if (value['success'] == true) {
//         UserViewModel userViewModel = UserViewModel();
//         userViewModel.saveUser(value['user_id'].toString());
//         Utils.show(value['message'], context);
//         // Navigator.pushNamed(context, RoutesName.navbar);
//
//         String? userId = await userViewModel.getUser();
//
//         print("User ID: $userId");
//         // context.goNamed(RoutesName.navbar);
//         // GoRouter.of(context).goNamed(RoutesName.navbar);
//
//         // Navigator.pushNamed(context, RoutesName.navbar);
//       } else {
//         print("Error Message: ${value['message']}");
//         if (value['message'] == "Email already exists") {
//           Utils.show("Email has already been taken", context);
//         } else {
//           Utils.show(value['message'], context);
//         }
//       }
//     } catch (error) {
//       if (kDebugMode) {
//         print('Error: $error');
//       }
//       Utils.show("Something went wrong. Please try again later.", context);
//     } finally {
//       setLoading(false);
//     }
//   }
// }
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:v_pharmashing/utils/routes/routes_name.dart';
import '../../repo/auth_repo.dart';
import '../../utils/utils.dart';
import '../user_view_model.dart';

class RegisterViewModel with ChangeNotifier {
  final _loginRepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
  Future<void> registerApi(dynamic name, dynamic email, dynamic mobile, BuildContext context) async {
    setLoading(true);
    Map<String, dynamic> data = {
      "name": name,
      "email": email,
      "mobile": mobile
    };
    print(data);

    try {
      final value = await _loginRepo.registerApi(data);
      if (value['success'] == true) {
        // ✅ Save user login info locally
        UserViewModel userViewModel = UserViewModel();
        await userViewModel.saveUser(value['id'].toString());

        final sp = await SharedPreferences.getInstance();
        await sp.setString('user_name', name);
        await sp.setBool('is_logged_in', true);

        // Close any open dialogs before navigating
        if (Navigator.canPop(context)) {
          Navigator.pop(context); // Close registration dialog
          Navigator.pop(context); // Close registration dialog
          Navigator.pop(context); // Close registration dialog
        }

        Utils.show(value['message'], context);

        // Navigate to dashboard or home screen
        // context.pushReplacementNamed(context, RoutesName.dashboardScreen);

        String? userId = await userViewModel.getUser();
        print("User Registered - User ID: $userId");

      } else {
        Utils.show(value['message'], context);
        print("Error Message: ${value['message']}");
        if (value['message'] == "Email already exists") {
          Utils.show("Email has already been taken", context);
        }
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error: $error');
      }
      Utils.show("Something went wrong. Please try again later.", context);
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
