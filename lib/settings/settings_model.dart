import 'package:flutter/material.dart';

class SettingsModel extends ChangeNotifier {
  String _languageCode = "English";

  String get languageCode => _languageCode;

  set languageCode(String value) {
    _languageCode = value;
    notifyListeners();
  }

  void changeLanguageCode(String code) {
    languageCode = code;
  }
}
