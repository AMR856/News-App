import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/home_screen/presentation/cubit/articles_cubit.dart';
import 'package:news_app/features/home_screen/presentation/cubit/sources_cubit.dart';
import 'package:news_app/features/home_screen/presentation/cubit/view_cubit.dart';
import 'package:news_app/features/home_screen/presentation/home_screen.dart';
import 'package:news_app/features/search_screen/cubit/selected_source_cubit.dart';
import 'package:news_app/features/search_screen/search_screen.dart';
import 'package:news_app/features/splash_screen/splash_screen.dart';
import 'package:news_app/core/di/di.dart';

abstract class RouteManager {
  static const String splashScreen = './splash-screen';
  static const String homeScreen = './home-screen';
  static const String searchScreen = './search-screen';

  static final Map<String, Widget Function(BuildContext)> routes = {
    splashScreen: (context) => const SplashScreen(),

    homeScreen: (context) => MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<ViewCubit>()),
        BlocProvider(create: (_) => getIt<SourcesCubit>()),
        BlocProvider(create: (_) => getIt<ArticlesCubit>()),
        BlocProvider(create: (_) => getIt<SelectedSourceCubit>()),
      ],
      child: const HomeScreen(),
    ),

    searchScreen: (context) => MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt<ArticlesCubit>()),
        BlocProvider.value(value: getIt<SelectedSourceCubit>()),
      ],
      child: const SearchScreen(),
    ),
  };
}
