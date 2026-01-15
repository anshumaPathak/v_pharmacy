// import 'dart:convert';
// import 'package:flutter/foundation.dart';
//
// import '../helper/network/base_api_services.dart';
// import '../helper/network/network_api_services.dart';
// import '../res/api_url.dart';
//
// class CreateOrderRepository {
//   final BaseApiServices _apiServices = NetworkApiServices();
//
//   Future<dynamic> createOrderApi(dynamic data) async {
//     try {
//       debugPrint("📤 Request Body: ${jsonEncode(data)}");
//       dynamic response = await _apiServices.getPostApiResponse(ApiUrl.createOrder, data);
//       debugPrint("✅ API Raw Response: ${jsonEncode(response)}");
//       return (response);
//     } catch (e) {
//       debugPrint('❌ Error occurred during acceptCallApi: $e');
//       rethrow;
//     }
//   }
// }
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import '../helper/network/base_api_services.dart';
import '../helper/network/network_api_services.dart';
import '../res/api_url.dart';

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
      // debugPrint("✅ API Raw Response: ${response.data}");
      return response.data;
    } catch (e) {
      debugPrint('❌ Error during API call: $e');
      rethrow;
    }
  }
}


