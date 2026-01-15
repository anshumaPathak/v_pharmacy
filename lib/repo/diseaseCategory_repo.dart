import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../helper/network/base_api_services.dart';
import '../helper/network/network_api_services.dart';
import '../model/disease_category_model.dart';
import '../res/api_url.dart';

class DiseaseCategoryRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<DisaseCategoryModel> diseaseCategoryApi() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(ApiUrl.diseaseCategories);
      // debugPrint("✅ API Raw Response: ${jsonEncode(response)}");
      return DisaseCategoryModel.fromJson(response);
    } catch (e) {
      debugPrint('❌ Error occurred during diseaseCategoryApi: $e');
      rethrow;
    }
  }
}
