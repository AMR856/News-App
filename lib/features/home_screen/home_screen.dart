import 'package:flutter/material.dart';
import 'package:news_app/features/home_screen/providers/view_provider.dart';
import 'package:news_app/features/home_screen/views/category_view.dart';
import 'package:news_app/features/home_screen/widgets/home_appbar.dart';
import 'package:news_app/features/home_screen/widgets/home_drawer.dart';
import 'package:provider/provider.dart';
import 'views/sources_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var viewProvider = Provider.of<ViewProvider>(context);
    Widget currentView = viewProvider.currentCategory == null
        ? CategoryView()
        : SourcesView(currentCategory: viewProvider.currentCategory);

    return Scaffold(
      drawer: const HomeDrawer(),
      appBar: const HomeAppbar(),
      body: currentView,
    );
  }
}
