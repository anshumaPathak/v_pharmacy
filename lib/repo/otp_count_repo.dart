import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../helper/network/base_api_services.dart';
import '../helper/network/network_api_services.dart';
import '../res/api_url.dart';

class OtpCountRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> otpCountApi() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(ApiUrl.otpCount);
      // debugPrint("✅ API Raw Response: ${jsonEncode(response)}");
      return (response);
    } catch (e) {
      debugPrint('❌ Error occurred during otpCountApi: $e');
      rethrow;
    }
  }
}
