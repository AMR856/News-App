import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/api/view_models/articles_view_model.dart';
import 'package:news_app/features/home_screen/providers/selected_source_provider.dart';
import 'package:news_app/features/home_screen/widgets/article_item.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final articlesVM = context.read<ArticlesViewModel>();
      final selectedSourceProvider = context.read<SelectedSourceProvider>();

      articlesVM.getArticles(selectedSourceProvider.selectedSourceId, null);
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    var sourceProvider = Provider.of<SelectedSourceProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.w),
              child: TextField(
                onChanged: (value) {
                  Provider.of<ArticlesViewModel>(
                    context,
                    listen: false,
                  ).getArticles(sourceProvider.selectedSourceId, value);
                },
                decoration: InputDecoration(
                  hintText: appLocalizations.search_articles,
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
            ),
            Expanded(
              child: Consumer<ArticlesViewModel>(
                builder: (context, viewModel, child) {
                  if (viewModel.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (viewModel.errorMessage != null) {
                    return Center(child: Text(viewModel.errorMessage!));
                  }

                  final articles = viewModel.articlesResponse?.articles ?? [];

                  if (articles.isEmpty) {
                    return Center(
                      child: Text(
                        appLocalizations.not_available,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    );
                  }

                  return ListView.separated(
                    padding: EdgeInsets.all(16.w),
                    itemCount: articles.length,
                    separatorBuilder: (_, __) => SizedBox(height: 20.h),
                    itemBuilder: (context, index) {
                      final article = articles[index];
                      return ArticleItem(article: article);
                    },
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
