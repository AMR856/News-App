import 'package:flutter/material.dart';
import 'package:news_app/config/shared_pref_manager.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _currentLocale = SharedPrefManager.getLang();

  Locale get currentLang => _currentLocale;

  void changeLang(Locale newLocale) {
    if (_currentLocale == newLocale) return;
    _currentLocale = newLocale;
    SharedPrefManager.setLang(newLocale);
    notifyListeners();
  }

  void toggleLang() {
    if (_currentLocale == Locale('en')) {
      _currentLocale = Locale('ar');
    } else {
      _currentLocale = Locale('en');
    }
    SharedPrefManager.setLang(_currentLocale);
    notifyListeners();
  }
}