import 'package:news_app/core/resources/image_manager.dart';

class CategoryModel{
  String id;
  String title;
  String photo;
  bool isTitleLeft;
  CategoryModel(this.id, this.title, this.photo, this.isTitleLeft);

  static List<CategoryModel> darkCategories = [
    CategoryModel('business', "Business", ImageManager.business, true),
    CategoryModel('entertainment', "Entertainment", ImageManager.entertainment, false),
    CategoryModel('general', "General", ImageManager.general, false),
    CategoryModel('health', "Health", ImageManager.health, true),
    CategoryModel('science', "Science", ImageManager.science, false),
    CategoryModel('sports', "Sports", ImageManager.sports, false),
    CategoryModel('technology', "Technology", ImageManager.technology, true),
  ];

  static List<CategoryModel> lightCategories = [
    CategoryModel('business', "Business", ImageManager.businessDark, true),
    CategoryModel('entertainment', "Entertainment", ImageManager.entertainmentDark, false),
    CategoryModel('general', "General", ImageManager.generalDark, false),
    CategoryModel('health', "Health", ImageManager.healthDark, true),
    CategoryModel('science', "Science", ImageManager.scienceDark, false),
    CategoryModel('sports', "Sports", ImageManager.sportsDark, false),
    CategoryModel('technology', "Technology", ImageManager.technologyDark, true),
  ];
}