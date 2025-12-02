import 'package:flutter/material.dart';
import 'package:news_app/api/view_models/articles_view_model.dart';
import 'package:news_app/features/home_screen/home_screen.dart';
import 'package:news_app/features/home_screen/providers/selected_source_provider.dart';
import 'package:news_app/features/home_screen/providers/view_provider.dart';
import 'package:news_app/features/search_screen/search_screen.dart';
import 'package:news_app/features/splash_screen/splash_screen.dart';
import 'package:news_app/repostories/articles_repository_impl.dart';
import 'package:provider/provider.dart';

abstract class RouteManager {
  static const String splashScreen = './splash-screen';
  static const String homeScreen = './home-screen';
  static const String searchScreen = './search-screen';
  static final Map<String, Widget Function(BuildContext)> routes = {
    splashScreen: (context) => SplashScreen(),
    homeScreen: (context) => MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ViewProvider()),
        ChangeNotifierProvider(create: (_) => SelectedSourceProvider()),
      ],
      child: const HomeScreen(),
    ),
    searchScreen: (context) => MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ArticlesViewModel(repository: ArticlesRepositoryImpl())),
        ChangeNotifierProvider(create: (_) => SelectedSourceProvider()),
      ],
      child: const SearchScreen(),
    ),
  };
}
