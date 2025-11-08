import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:v_pharmashing/repo/contact_repo.dart';
import 'package:v_pharmashing/repo/rating_repo.dart';
import 'package:v_pharmashing/utils/routes/routes_name.dart';
import 'package:v_pharmashing/view_model/user_view_model.dart';
import '../../utils/utils.dart';


// class RatingViewModel with ChangeNotifier {
//   final _loginRepo = RatingRepository();
//   bool _loading = false;
//   bool get loading => _loading;
//
//   setLoading(bool value) {
//     _loading = value;
//     notifyListeners();
//   }
//
//   Future<void> ratingApi(dynamic delivery_boy_id, dynamic order_id,dynamic rating,
//       dynamic review,BuildContext context) async {
//
//     final userViewModel = Provider.of<UserViewModel>(context, listen: false);
//     String? userId = await userViewModel.getUser();
//     setLoading(true);
//     Map<String, dynamic> data = {
//       "delivery_boy_id": delivery_boy_id,
//       "order_id": order_id,
//       "user_id": userId,
//       "rating":rating,
//       "review":review
//     };
//     print("Data sent to API: $data");
//
//     try {
//       final value = await _loginRepo.ratingApi(data);
//       if (value['success'] == true) {
//         Utils.show(value['message'], context);
//         // Navigator.pushReplacementNamed(context, RoutesName.dashboardScreen);
//         print("API Success: ${value['message']}");
//         Navigator.pop(context);
//       } else {
//         Utils.show(value['message'], context);
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
//
// }
class RatingViewModel with ChangeNotifier {
  final _loginRepo = RatingRepository();
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> ratingApi(
      dynamic delivery_boy_id,
      dynamic order_id,
      dynamic rating,
      dynamic review,
      BuildContext context,
      ) async {
    final userViewModel = Provider.of<UserViewModel>(context, listen: false);
    String? userId = await userViewModel.getUser();

    setLoading(true);

    Map<String, dynamic> data = {
      "delivery_boy_id": delivery_boy_id,
      "order_id": order_id,
      "user_id": userId,
      "rating": rating,
      "review": review,
    };

    // print("Data sent to API: $data");

    try {
      final response = await _loginRepo.ratingApi(data);

      // 🔹 201 => Success
      if (response['statusCode'] == 201 || response['success'] == true) {
        Utils.show(response['message'], context);
        Navigator.pop(context);
      }

      // 🔹 409 => Already rated or conflict
      else if (response['statusCode'] == 409 ||
          (response['success'] == false &&
              (response['message']?.toString().contains("already rated") ?? false))) {
        Utils.show(response['message'] ?? "You have already rated this delivery boy for this order", context);
      }

      // 🔹 Other cases
      else {
        Utils.show(response['message'] ?? "You have already rated this delivery boy for this order.", context);
      }
    } catch (error) {
      // print('❌ Error occurred during ratingApi: $error');

      String errorMessage = "You have already rated this delivery boy for this order.";
      final errorStr = error.toString();

      // ✅ Handle Conflict (409)
      if (errorStr.contains('Status Code: 409')) {
        if (errorStr.contains('"message":')) {
          final start = errorStr.indexOf('"message":') + 10;
          final end = errorStr.indexOf('"', start);
          if (end > start) {
            errorMessage = errorStr.substring(start, end);
          }
        } else {
          errorMessage = "You have already rated this delivery boy for this order";
        }
        Utils.show(errorMessage, context);
      }

      // ✅ Handle Success-like 201 with exception (rare case)
      else if (errorStr.contains('Status Code: 201')) {
        Utils.show("Rating submitted successfully!", context);
        Navigator.pop(context);
      }

      // 🔹 Default case
      else {
        Utils.show(errorMessage, context);
      }
    } finally {
      setLoading(false);
    }
  }
}
