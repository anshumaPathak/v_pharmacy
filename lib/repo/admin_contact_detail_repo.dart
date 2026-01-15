import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:v_pharmashing/model/admin_contact_model.dart';

import '../helper/network/base_api_services.dart';
import '../helper/network/network_api_services.dart';
import '../res/api_url.dart';

class AdminContactRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> adminContactApi() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(ApiUrl.adminContactDetail);
      // debugPrint("✅ API Raw Response: ${jsonEncode(response)}");
      return AdminContactModel.fromJson(response);
    } catch (e) {
      debugPrint('❌ Error occurred during adminContactApi: $e');
      rethrow;
    }
  }
}
