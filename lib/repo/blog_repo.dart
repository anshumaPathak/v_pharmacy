// import 'package:v_pharmashing/model/blog_model.dart';
// import '../helper/network/base_api_services.dart';
// import '../helper/network/network_api_services.dart';
// import '../res/api_url.dart';
//
// class BlogRepository {
//   final BaseApiServices _apiServices = NetworkApiServices();
//
//   Future<BlogModel> blogApi(dynamic data) async {
//     try {
//       // debugPrint("📤 Request Body: ${jsonEncode(data)}");
//       dynamic response = await _apiServices.getGetApiResponse(ApiUrl.blog,);
//       // debugPrint("✅ API Raw Response: ${jsonEncode(response)}");
//       return BlogModel.fromJson(response);
//     } catch (e) {
//       // debugPrint('❌ Error occurred during blogApi: $e');
//       rethrow;
//     }
//   }
// }
import 'package:v_pharmashing/model/blog_model.dart';
import '../helper/network/base_api_services.dart';
import '../helper/network/network_api_services.dart';
import '../res/api_url.dart';

class BlogRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<BlogModel> blogApi(int type) async {
    try {
      // ✅ GET request with type parameter
      String url = "${ApiUrl.blog}/$type";
      final response = await _apiServices.getGetApiResponse(url);

      // ✅ Parse the response into model
      return BlogModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}

