import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/api/view_models/articles_view_model.dart';
import 'package:news_app/api/view_models/sources_view_model.dart';
import 'package:news_app/features/home_screen/providers/selected_source_provider.dart';
import 'package:news_app/features/home_screen/widgets/article_item.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SourcesView extends StatefulWidget {
  final String? currentCategory;

  const SourcesView({super.key, required this.currentCategory});

  @override
  State<SourcesView> createState() => _SourcesViewState();
}

class _SourcesViewState extends State<SourcesView>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

    @override
    void initState() {
      super.initState();

      WidgetsBinding.instance.addPostFrameCallback((_) async {
        final sourcesVM = context.read<SourcesViewModel>();
        final articlesVM = context.read<ArticlesViewModel>();
        final selectedSource = context.read<SelectedSourceProvider>();

        await sourcesVM.getSources(widget.currentCategory);

        final sources = sourcesVM.sourcesResponse?.sources ?? [];
        if (sources.isNotEmpty) {
          tabController = TabController(length: sources.length, vsync: this);
          selectedSource.setSelectedSource(sources[0].id);
          articlesVM.getArticles(sources[0].id, null);

          tabController!.addListener(() {
            if (tabController!.indexIsChanging) return;

            final newSource = sources[tabController!.index];
            selectedSource.setSelectedSource(newSource.id);
            articlesVM.getArticles(newSource.id, null);
          });

          setState(() {});
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    return SafeArea(
      child: Padding(
        padding: REdgeInsets.all(16),
        child: Column(
          children: [
            Consumer<SourcesViewModel>(
              builder: (context, viewModel, child) {
                if (viewModel.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (viewModel.errorMessage != null) {
                  return Center(
                    child: Text(
                      viewModel.errorMessage!,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  );
                }

                final sources = viewModel.sourcesResponse?.sources ?? [];
                if (sources.isEmpty) {
                  return Center(
                    child: Text(
                      appLocalizations.no_sources,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                  );
                }

                if (tabController == null) {
                  return const Center(child: CircularProgressIndicator());
                }

                return Column(
                  children: [
                    TabBar(
                      controller: tabController,
                      isScrollable: true,
                      tabs: sources
                          .map((source) => Tab(text: source.name))
                          .toList(),
                    ),
                    SizedBox(height: 16.h),
                  ],
                );
              },
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
