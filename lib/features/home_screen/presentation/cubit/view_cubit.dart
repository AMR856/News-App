import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/l10n/app_localizations.dart';

@Singleton()
class ViewCubit extends Cubit<ViewState> {
  ViewCubit() : super(ViewInitial());

  String? _currentCategory;

  String? get currentCategory => _currentCategory;

  void setCategory(String? category) {
    _currentCategory = category;
    emit(ViewCategoryChanged(category));
  }

  void clearCategory() {
    _currentCategory = null;
    emit(ViewCategoryChanged(null));
  }

  String title(BuildContext context) {
    if (_currentCategory == null) {
      return AppLocalizations.of(context)!.home;
    }
    return _mapCategoryToTitle(context, _currentCategory!);
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
  @override
  Future<void> close() {
    print("ViewCubit is being disposed");
    return super.close();
  }
}

abstract class ViewState {}

class ViewInitial extends ViewState {}

class ViewCategoryChanged extends ViewState {
  final String? category;
  ViewCategoryChanged(this.category);
}