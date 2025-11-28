import 'package:flutter/material.dart';

class ViewProvider extends ChangeNotifier {
  String? _currentCategory;
  String _title = 'Home';
  String? get currentCategory => _currentCategory;
  String get title => _title;

  void setCategory(String? category) {
    _currentCategory = category;
    _title = capitalize(_currentCategory!);
    notifyListeners();
  }

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  void clearCategory() {
    _currentCategory = null;
    _title = 'Home';
    notifyListeners();
  }
}
