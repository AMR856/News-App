import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/home_screen/presentation/cubit/articles_cubit.dart';
import 'package:news_app/features/home_screen/presentation/widgets/article_item.dart';
import 'package:news_app/features/search_screen/cubit/selected_source_cubit.dart';
import 'package:news_app/l10n/app_localizations.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final selectedSourceId = context.read<SelectedSourceCubit>().state;

      if (selectedSourceId != null) {
        context.read<ArticlesCubit>().getArticles(selectedSourceId);
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    final selectedSourceId = context.watch<SelectedSourceCubit>().state;

    final sourceName = selectedSourceId ?? "Unknown Source";

    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading:  Padding(
          padding: REdgeInsets.symmetric(horizontal: 12.0),
          child: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        title: Padding(
          padding: REdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
            sourceName.replaceAll('-', ' '),
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.w),
              child: TextField(
                controller: _searchController,
                onChanged: (query) {
                  if (selectedSourceId != null && query.isNotEmpty) {
                    context.read<ArticlesCubit>().getArticles(
                      selectedSourceId,
                      query: query,
                    );
                  } else if (selectedSourceId != null) {
                    context.read<ArticlesCubit>().getArticles(selectedSourceId);
                  }
                },
                decoration: InputDecoration(
                  hintText: loc.search_articles,
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
            ),

            // Articles List
            Expanded(
              child: BlocBuilder<ArticlesCubit, ArticlesState>(
                builder: (context, state) {
                  if (state is ArticlesLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is ArticlesError) {
                    return Center(child: Text(state.message));
                  }

                  final articles = state is ArticlesSuccess ? state.articles : [];

                  if (articles.isEmpty) {
                    return Center(
                      child: Text(
                        loc.not_available,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    );
                  }

                  return ListView.separated(
                    padding: EdgeInsets.all(16.w),
                    itemCount: articles.length,
                    separatorBuilder: (_, __) => SizedBox(height: 20.h),
                    itemBuilder: (_, index) => ArticleItem(article: articles[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
