// // // import 'package:flutter/cupertino.dart';
// // // import 'package:flutter/foundation.dart';
// // // import 'package:v_pharmashing/model/blog_model.dart';
// // // import 'package:v_pharmashing/repo/blog_repo.dart';
// // // import '../../utils/utils.dart';
// // //
// // //
// // // class BlogViewModel with ChangeNotifier {
// // //   final _loginRepo = BlogRepository();
// // //   bool _loading = false;
// // //   bool get loading => _loading;
// // //   BlogModel? _blogModel;
// // //   BlogModel? get blogModel => _blogModel;
// // //
// // //   setModelData(BlogModel value) {
// // //     _blogModel = value;
// // //     notifyListeners();
// // //   }
// // //   setLoading(bool value) {
// // //     _loading = value;
// // //     notifyListeners();
// // //   }
// // //
// // //   Future<void> blogApi(dynamic type, BuildContext context) async {
// // //     setLoading(true);
// // //     Map<String, dynamic> data = {
// // //       "type": type
// // //
// // //     };
// // //     print("Data sent to API: $data");
// // //
// // //     try {
// // //       final value = await _loginRepo.blogApi(data);
// // //       if (value['status'] == true) {
// // //         setModelData(value);
// // //         Utils.show(value['message'], context);
// // //
// // //         print("API Success: ${value['message']}");
// // //       } else {
// // //         Utils.show(value['message'], context);
// // //       }
// // //     } catch (error) {
// // //       if (kDebugMode) {
// // //         print('Error: $error');
// // //       }
// // //       Utils.show("Something went wrong. Please try again later.", context);
// // //     } finally {
// // //       setLoading(false);
// // //     }
// // //   }
// // //
// // // }
// //
// // import 'package:flutter/foundation.dart';
// // import 'package:flutter/material.dart';
// // import 'package:v_pharmashing/model/blog_model.dart';
// // import 'package:v_pharmashing/repo/blog_repo.dart';
// // import '../../utils/utils.dart';
// //
// // class BlogViewModel with ChangeNotifier {
// //   final _blogRepo = BlogRepository();
// //
// //   bool _loading = false;
// //   bool get loading => _loading;
// //
// //   BlogModel? _blogModel;
// //   BlogModel? get blogModel => _blogModel;
// //
// //   void setLoading(bool value) {
// //     _loading = value;
// //     notifyListeners();
// //   }
// //
// //   Future<void> blogApi(String type, BuildContext context) async {
// //     setLoading(true);
// //
// //     try {
// //       // ✅ API call
// //       final response = await _blogRepo.blogApi({"type": type});
// //
// //       // ✅ Check and parse response
// //       if (response != null ) {
// //         _blogModel = BlogModel.fromJson(response["data"]);
// //         notifyListeners();
// //         Utils.show("Blog loaded successfully!", context);
// //       } else {
// //         // Utils.show(response["message"] ?? "No data found", context);
// //       }
// //     } catch (error) {
// //       if (kDebugMode) {
// //         print("Error in blogApi: $error");
// //       }
// //       Utils.show("Something went wrong. Please try again later.", context);
// //     } finally {
// //       setLoading(false);
// //     }
// //   }
// // }
// //
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:v_pharmashing/model/blog_model.dart';
// import 'package:v_pharmashing/repo/blog_repo.dart';
// import '../../utils/utils.dart';
//
// class BlogViewModel with ChangeNotifier {
//   final _blogRepo = BlogRepository();
//
//   bool _loading = false;
//   bool get loading => _loading;
//
//
//   BlogModel? _blogModel;
//   BlogModel? get blogModel => _blogModel;
//
//   setModelData(BlogModel value) {
//     _blogModel = value;
//     notifyListeners();
//   }
//
//   void setLoading(bool value) {
//     _loading = value;
//     notifyListeners();
//   }
//
//   Future<void> blogApi(int type, BuildContext context) async {
//     setLoading(true);
//     try {
//       // ✅ Call API
//       BlogModel response = await _blogRepo.blogApi(type);
//
//       if (response.data != null && response.data!.isNotEmpty) {
//         // _blogList = response.data!.cast<BlogModel>();
//         notifyListeners();
//       } else {
//         // _blogList = [];
//         Utils.show("No blogs found.", context);
//       }
//     } catch (error) {
//       if (kDebugMode) {
//         print("❌ Error in blogApi: $error");
//       }
//       Utils.show("Something went wrong. Please try again later.", context);
//     } finally {
//       setLoading(false);
//     }
//   }
// }
//
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

  Future<void> blogApi(int type, BuildContext context) async {
    setLoading(true);
    try {
      BlogModel response = await _blogRepo.blogApi(type);
      _blogModel = response; // ✅ Assign model properly
      notifyListeners();

      if (response.data == null || response.data!.isEmpty) {
        Utils.show("No blogs found.", context);
      }
    } catch (error) {
      if (kDebugMode) {
        print("❌ Error in blogApi: $error");
      }
      Utils.show("Something went wrong. Please try again later.", context);
    } finally {
      setLoading(false);
    }
  }
}
