import 'package:flutter/material.dart';
import 'package:news_app/l10n/app_localizations.dart';

class ViewProvider extends ChangeNotifier {
  String? _currentCategory;

  String? get currentCategory => _currentCategory;

  String title(BuildContext context) {
    if (_currentCategory == null) {
      return AppLocalizations.of(context)!.home;
    }
    return _mapCategoryToTitle(context, _currentCategory!);
  }

  void setCategory(String? category) {
    _currentCategory = category;
    notifyListeners();
  }

  void clearCategory(BuildContext context) {
    _currentCategory = null;
    notifyListeners();
  }

  String _mapCategoryToTitle(BuildContext context, String id) {
    final loc = AppLocalizations.of(context)!;

    switch (id) {
      case "business":
        return loc.business;
      case "entertainment":
        return loc.entertainment;
      case "general":
        return loc.general;
      case "health":
        return loc.health;
      case "science":
        return loc.science;
      case "sports":
        return loc.sports;
      case "technology":
        return loc.technology;
      default:
        return loc.unknown;
    }
  }
}
