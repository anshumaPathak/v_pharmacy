import 'package:flutter/foundation.dart';
import 'package:v_pharmashing/repo/admin_contact_detail_repo.dart';
import 'package:v_pharmashing/repo/diseaseCategory_repo.dart';

import '../model/admin_contact_model.dart';
import '../model/disease_category_model.dart';

// class AdminContactViewModel with ChangeNotifier {
//   final _repo = AdminContactRepository();
//
//   bool _loading = false;
//   bool get loading => _loading;
//
//   setLoading(bool value) {
//     _loading = value;
//     notifyListeners();
//   }
//
//   AdminContactModel? _adminContactModel;
//   AdminContactModel? get adminContactModel => _adminContactModel;
//
//   setModelData(AdminContactModel value) {
//     _adminContactModel = value;
//     notifyListeners();
//   }
//
//   Future<void> adminContactApi() async {
//     setLoading(true);
//     _repo.adminContactApi().then((value) {
//       setModelData(value);
//       setLoading(false);
//     }).onError((error, stackTrace) {
//       setLoading(false);
//       if (kDebugMode) {
//         print('error: $error');
//       }
//     });
//   }
// }
class AdminContactViewModel with ChangeNotifier {
  final _repo = AdminContactRepository();

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  AdminContactModel? _adminContactModel;
  AdminContactModel? get adminContactModel => _adminContactModel;

  setModelData(AdminContactModel value) {
    _adminContactModel = value;
    notifyListeners();
  }

  Future<void> adminContactApi() async {
    setLoading(true);
    _repo.adminContactApi().then((value) {
      setModelData(value);
      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        // print('error: $error');
      }
    });
  }
}
