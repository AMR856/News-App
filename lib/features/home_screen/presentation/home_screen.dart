import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/home_screen/presentation/cubit/view_cubit.dart';
import 'package:news_app/features/home_screen/presentation/views/category_view.dart';
import 'package:news_app/features/home_screen/presentation/views/sources_view.dart';
import 'package:news_app/features/home_screen/presentation/widgets/home_appbar.dart';
import 'package:news_app/features/home_screen/presentation/widgets/home_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewCubit, ViewState>(
      builder: (context, state) {
        final currentCategory = state is ViewCategoryChanged
            ? state.category
            : null;

        return Scaffold(
          drawer: const HomeDrawer(),
          appBar: HomeAppbar(),
          body: currentCategory == null
              ? const CategoryView()
              : SourcesView(currentCategory: currentCategory),
        );
      },
    );
  }
}
