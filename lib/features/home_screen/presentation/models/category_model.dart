import 'package:flutter/cupertino.dart';
import 'package:news_app/core/resources/image_manager.dart';
import 'package:news_app/l10n/app_localizations.dart';

class CategoryModel {
  String id;
  String title;
  String photo;
  bool isTitleLeft;
  CategoryModel(this.id, this.title, this.photo, this.isTitleLeft);

  static List<CategoryModel> getDarkCategories(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    return [
      CategoryModel('business', appLocalizations.business, ImageManager.business, true),
      CategoryModel(
        'entertainment',
        appLocalizations.entertainment,
        ImageManager.entertainment,
        false,
      ),
      CategoryModel('general', appLocalizations.general, ImageManager.general, false),
      CategoryModel('health', appLocalizations.health, ImageManager.health, true),
      CategoryModel('science', appLocalizations.science, ImageManager.science, false),
      CategoryModel('sports', appLocalizations.sports, ImageManager.sports, false),
      CategoryModel('technology', appLocalizations.technology, ImageManager.technology, true),
    ];
  }

  static List<CategoryModel> getLightCategories(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    return [
      CategoryModel('business', appLocalizations.business, ImageManager.businessDark, true),
      CategoryModel(
        'entertainment',
        appLocalizations.entertainment,
        ImageManager.entertainmentDark,
        false,
      ),
      CategoryModel('general', appLocalizations.general, ImageManager.generalDark, false),
      CategoryModel('health', appLocalizations.health, ImageManager.healthDark, true),
      CategoryModel('science', appLocalizations.science, ImageManager.scienceDark, false),
      CategoryModel('sports', appLocalizations.sports, ImageManager.sportsDark, false),
      CategoryModel(
        'technology',
        appLocalizations.technology,
        ImageManager.technologyDark,
        true,
      ),
    ];
  }
}
