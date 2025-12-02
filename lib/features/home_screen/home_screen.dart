import 'package:flutter/material.dart';
import 'package:news_app/api/view_models/articles_view_model.dart';
import 'package:news_app/api/view_models/sources_view_model.dart';
import 'package:news_app/features/home_screen/providers/view_provider.dart';
import 'package:news_app/features/home_screen/views/category_view.dart';
import 'package:news_app/features/home_screen/widgets/home_appbar.dart';
import 'package:news_app/features/home_screen/widgets/home_drawer.dart';
import 'package:news_app/repostories/articles_repository_impl.dart';
import 'package:provider/provider.dart';
import 'package:news_app/repostories/sources_repository_impl.dart';
import 'providers/selected_source_provider.dart';
import 'views/sources_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var viewProvider = Provider.of<ViewProvider>(context);
    Widget currentView = viewProvider.currentCategory == null
        ? CategoryView()
        : MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => SourcesViewModel(repository: SourcesRepositoryImpl())),
              ChangeNotifierProvider(create: (_) => ArticlesViewModel(repository: ArticlesRepositoryImpl())),
              ChangeNotifierProvider(create: (_) => SelectedSourceProvider()),
            ],

            child: SourcesView(currentCategory: viewProvider.currentCategory),
          );

    return Scaffold(
      drawer: const HomeDrawer(),
      appBar: HomeAppbar(),
      body: currentView,
    );
  }
}
