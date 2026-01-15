import 'package:flutter/cupertino.dart';

class LanguageViewModel extends ChangeNotifier {
  String languageCode;

  LanguageViewModel(this.languageCode);

  void setLanguage(String code) {
    languageCode = code;
    notifyListeners();
  }
}
