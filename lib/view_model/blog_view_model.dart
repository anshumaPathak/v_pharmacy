// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:v_pharmashing/model/blog_model.dart';
// import 'package:v_pharmashing/repo/blog_repo.dart';
// import '../../utils/utils.dart';
//
//
// class BlogViewModel with ChangeNotifier {
//   final _loginRepo = BlogRepository();
//   bool _loading = false;
//   bool get loading => _loading;
//   BlogModel? _blogModel;
//   BlogModel? get blogModel => _blogModel;
//
//   setModelData(BlogModel value) {
//     _blogModel = value;
//     notifyListeners();
//   }
//   setLoading(bool value) {
//     _loading = value;
//     notifyListeners();
//   }
//
//   Future<void> blogApi(dynamic type, BuildContext context) async {
//     setLoading(true);
//     Map<String, dynamic> data = {
//       "type": type
//
//     };
//     print("Data sent to API: $data");
//
//     try {
//       final value = await _loginRepo.blogApi(data);
//       if (value['status'] == true) {
//         setModelData(value);
//         Utils.show(value['message'], context);
//
//         print("API Success: ${value['message']}");
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

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:v_pharmashing/model/blog_model.dart';
import 'package:v_pharmashing/repo/blog_repo.dart';
import '../../utils/utils.dart';

class BlogViewModel with ChangeNotifier {
  final _blogRepo = BlogRepository();

  bool _loading = false;
  bool get loading => _loading;

  BlogModel? _blogModel;
  BlogModel? get blogModel => _blogModel;

  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> blogApi(dynamic type, BuildContext context) async {
    setLoading(true);
    Map<String, dynamic> data = {"type": type};
    // print("Data sent to API: $data");

    try {
      final value = await _blogRepo.blogApi(data);
      // print("API Raw Response: $value");

      if (value['status'] == true) {
        _blogModel = BlogModel.fromJson(value);
        notifyListeners();
        Utils.show(value['message'], context);
        // print("API Success: ${value['message']}");
      } else {
        Utils.show(value['message'], context);
      }
    } catch (error) {
      if (kDebugMode) {
        // print('Error: $error');
      }
      // Utils.show("Something went wrong. Please try again later.", context);
    } finally {
      setLoading(false);
    }
  }
}
