import 'package:flutter/material.dart';

class SelectedSourceProvider extends ChangeNotifier {
  String? _selectedSourceId;

  String? get selectedSourceId => _selectedSourceId;

  void setSelectedSource(String sourceId) {
    if (_selectedSourceId != sourceId) {
      _selectedSourceId = sourceId;
      notifyListeners();
    }
  }
}