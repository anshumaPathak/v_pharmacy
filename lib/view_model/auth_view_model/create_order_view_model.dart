// import 'package:flutter/foundation.dart';
// import 'package:provider/provider.dart';
// import '../../repo/create_order_repo.dart';
// import '../../utils/utils.dart';
// import '../user_view_model.dart';
//
//
// class CreateOrderViewModel with ChangeNotifier {
//   final _loginRepo = CreateOrderRepository();
//   bool _loading = false;
//   bool get loading => _loading;
//   setLoading(bool value) {
//     _loading = value;
//     notifyListeners();
//   }
//
//   Future<void> createOrderApi(dynamic fullName,dynamic diseaseCategory, dynamic deliveryAddress,
//       dynamic whatsappNumber,dynamic alternateNumber,dynamic medicineDuration,dynamic specialInstructions,
//       dynamic prescriptionFile,context) async {
//     UserViewModel userViewModel = UserViewModel();
//     String? userId = await userViewModel.getUser();
//
//     setLoading(true);
//     Map<String, dynamic> data = {
//       "user_id":userId,
//       "full_name": fullName,
//       "disease_category":diseaseCategory,
//       "delivery_address":deliveryAddress,
//       "whatsapp_number":whatsappNumber,
//       "alternate_number":alternateNumber,
//       "medicine_duration":medicineDuration,
//       "special_instructions":specialInstructions,
//       "prescription_file":prescriptionFile
//     };
//     print(data);
//     try {
//       final value = await _loginRepo.createOrderApi(data);
//       if (value['success'] == true) {
//         final userViewModel = Provider.of<UserViewModel>(context, listen: false);
//         String? userId = await userViewModel.getUser();
//
//         // Utils.show(value['message'], context);
//
//         // String? userId = await userViewModel.getUser();
//
//         print("User ID: $userId");
//         // context.goNamed(RoutesName.navbar);
//         // GoRouter.of(context).goNamed(RoutesName.navbar);
//
//         // Navigator.pushNamed(context, RoutesName.navbar);
//       } else {
//         print(" ${value['message']}");
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
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart'; // for MediaType
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../res/api_url.dart';
import '../../utils/utils.dart';
import '../user_view_model.dart';

class CreateOrderViewModel with ChangeNotifier {
  final _loginRepo = CreateOrderRepository();
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> createOrderApi(
      String fullName,
      String diseaseCategory,
      String deliveryAddress,
      String whatsappNumber,
      String alternateNumber,
      String medicineDuration,
      String specialInstructions,
      List<dynamic> prescriptionFiles, // Uint8List[] for Web, File[] for Mobile
      BuildContext context,
      ) async
  {
    UserViewModel userViewModel = UserViewModel();
    String? userId = await userViewModel.getUser();

    setLoading(true);

    try {
      // 🔹 Prepare MultipartFile list
      List<MultipartFile> files = [];

      if (prescriptionFiles.isNotEmpty) {
        if (kIsWeb) {
          for (var bytes in prescriptionFiles) {
            files.add(MultipartFile.fromBytes(
              bytes,
              filename: "image_${DateTime.now().millisecondsSinceEpoch}.png",
              contentType: MediaType("image", "png"),
            ));
          }
        } else {
          for (var img in prescriptionFiles) {
            files.add(await MultipartFile.fromFile(
              img.path,
              filename: img.path.split('/').last,
              contentType: MediaType("image", "png"),
            ));
          }
        }
      }

      if (files.isEmpty) {
        Utils.show("Please add at least one prescription image.", context);
        return;
      }

      // 🔹 Create FormData
      FormData formData = FormData.fromMap({
        "user_id": userId,
        "full_name": fullName,
        "disease_category": diseaseCategory,
        "delivery_address": deliveryAddress,
        "whatsapp_number": whatsappNumber,
        "alternate_number": alternateNumber,
        "medicine_duration": medicineDuration,
        "special_instructions": specialInstructions,
        "prescription_files": files, // ✅ plural key
      });

      // debugPrint("📤 Sending FormData: ${files.map((f) => f.filename).toList()}");

      // 🔹 Call API
      final value = await _loginRepo.createOrderApi(formData);

      if (value['success'] == true) {
        // print("✅ Order created successfully");
        Utils.show("Order placed successfully", context);
      } else {
        Utils.show(value['message'] ?? "Something went wrong", context);
      }
    } catch (error) {
      if (kDebugMode) print('❌ Error: $error');
      Utils.show("Something went wrong. Please try again later.", context);
    } finally {
      setLoading(false);
    }
  }
}

// Repository
class CreateOrderRepository {
  Future<dynamic> createOrderApi(FormData data) async {
    try {
      Dio dio = Dio();
      Response response = await dio.post(
        ApiUrl.createOrder,
        data: data,
        options: Options(
          headers: {
            "Content-Type": "multipart/form-data",
          },
        ),
      );
      debugPrint("✅ API Raw Response: ${response.data}");
      return response.data;
    } catch (e) {
      debugPrint('❌ Error during API call: $e');
      rethrow;
    }
  }
}


