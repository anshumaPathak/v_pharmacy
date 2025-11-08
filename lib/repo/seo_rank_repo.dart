import '../helper/network/base_api_services.dart';
import '../helper/network/network_api_services.dart';
import '../res/api_url.dart';

class SeoRankRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> seoRankApi(dynamic data) async {
    try {
      // debugPrint("📤 Request Body: ${jsonEncode(data)}");
      dynamic response = await _apiServices.getPostApiResponse(ApiUrl.seoRank, data);
      // debugPrint("✅ API Raw Response: ${jsonEncode(response)}");
      return (response);
    } catch (e) {
      // debugPrint('❌ Error occurred during blogApi: $e');
      rethrow;
    }
  }
}
