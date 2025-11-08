import 'package:flutter/foundation.dart';
import 'package:v_pharmashing/repo/diseaseCategory_repo.dart';

import '../model/disease_category_model.dart';

class DisasesCategoryViewModel with ChangeNotifier {
  final _repo = DiseaseCategoryRepository();

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  DisaseCategoryModel? _disaseCategoryModel;
  DisaseCategoryModel? get disaseCategoryModel => _disaseCategoryModel;

  setModelData(DisaseCategoryModel value) {
    _disaseCategoryModel = value;
    notifyListeners();
  }

  Future<void> diseaseCategoryApi() async {
    setLoading(true);
    _repo.diseaseCategoryApi().then((value) {
      setModelData(value);
      setLoading(false);
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }
}
