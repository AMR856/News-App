import 'package:flutter/material.dart';
import 'package:news_app/features/home_screen/home_screen.dart';
import 'package:news_app/features/home_screen/providers/view_provider.dart';
import 'package:news_app/features/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

abstract class RouteManager {
  static const String splashScreen = './splash-screen';
  static const String homeScreen = './home-screen';

  static final Map<String, Widget Function(BuildContext)> routes = {
    splashScreen: (context) => SplashScreen(),
    homeScreen: (context) => ChangeNotifierProvider(
      create: (_) => ViewProvider(),
      child: const HomeScreen(),
    ),
  };
}