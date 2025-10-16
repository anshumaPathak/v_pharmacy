import 'dart:convert';
import 'package:flutter/foundation.dart';

import '../helper/network/base_api_services.dart';
import '../helper/network/network_api_services.dart';
import '../res/api_url.dart';

class PrivacyPolicyRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> privacyPolicyApi(dynamic data) async {
    try {
      debugPrint("📤 Request Body: ${jsonEncode(data)}");
      dynamic response = await _apiServices.getPostApiResponse(ApiUrl.privacyPolicy, data);
      debugPrint("✅ API Raw Response: ${jsonEncode(response)}");
      return (response);
    } catch (e) {
      debugPrint('❌ Error occurred during privacyPolicyApi: $e');
      rethrow;
    }
  }
}
