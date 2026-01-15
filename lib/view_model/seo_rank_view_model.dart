import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:v_pharmashing/model/blog_model.dart';
import 'package:v_pharmashing/repo/blog_repo.dart';
import 'package:v_pharmashing/repo/seo_rank_repo.dart';
import '../../utils/utils.dart';

class SeoRankViewModel with ChangeNotifier {
  final _blogRepo = SeoRankRepository();

  bool _loading = false;
  bool get loading => _loading;
  Future<void> seoRankApi(dynamic blogId, BuildContext context) async {
    Map<String, dynamic> data = {"blog_id": blogId};

    final response = await _blogRepo.seoRankApi(data);

    if (response != null && response is Map<String, dynamic>) {
      final status = response['status'];
      final message = response['message'] ?? '';
      final data = response['data'];

      if (status == true) {
        // Utils.show(message.isNotEmpty ? message : 'SEO Rank updated successfully', context);
        notifyListeners();

        // Agar tumhe SEO rank ya id use karni hai to yahan le sakti ho:
        // int rank = data?['seo_rank'] ?? 0;
        // print('Updated rank: $rank');
      } else if (status == false) {
        Utils.show(message.isNotEmpty ? message : 'Conflict or already exists', context);
      } else {
        // Utils.show('Unexpected response structure', context);
      }
    } else {
      Utils.show('No response from server or invalid data format', context);
    }
  }


  // Future<void> seoRankApi(dynamic type, BuildContext context) async {
  //   Map<String, dynamic> data = {"type": type};
  //   // print("Data sent to API: $data");
  //
  //   try {
  //     final value = await _blogRepo.seoRankApi(data);
  //     // print("API Raw Response: $value");
  //
  //     if (value['status'] == true) {
  //       notifyListeners();
  //       Utils.show(value['message'], context);
  //       // print("API Success: ${value['message']}");
  //     } else {
  //       Utils.show(value['message'], context);
  //     }
  //   } catch (error) {
  //     if (kDebugMode) {
  //       // print('Error: $error');
  //     }
  //     // Utils.show("Something went wrong. Please try again later.", context);
  //   } finally {
  //   }
  // }
}