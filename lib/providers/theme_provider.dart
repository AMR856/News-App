import 'package:flutter/material.dart';
import 'package:news_app/config/shared_pref_manager.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _currentTheme = SharedPrefManager.getTheme();

  ThemeMode get currentTheme => _currentTheme;

  void changeTheme(ThemeMode newTheme) {
    if (_currentTheme == newTheme) return;
    _currentTheme = newTheme;
    SharedPrefManager.setTheme(newTheme);
    notifyListeners();
  }

  void toggleTheme() {
    if (_currentTheme == ThemeMode.dark) {
      _currentTheme = ThemeMode.light;
    } else {
      _currentTheme = ThemeMode.dark;
    }

    SharedPrefManager.setTheme(_currentTheme);
    notifyListeners();
  }
}