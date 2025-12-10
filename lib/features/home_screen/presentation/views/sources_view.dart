import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/home_screen/domain/entites/source_entity.dart';
import 'package:news_app/features/home_screen/presentation/cubit/articles_cubit.dart';
import 'package:news_app/features/home_screen/presentation/cubit/sources_cubit.dart';
import 'package:news_app/features/home_screen/presentation/widgets/article_item.dart';
import 'package:news_app/features/search_screen/cubit/selected_source_cubit.dart';
import 'package:news_app/l10n/app_localizations.dart';

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
    context.read<SourcesCubit>().getSources(widget.currentCategory);
  }

  void setupTabs(List<SourceEntity> sources) {
    if (tabController == null) {
      tabController = TabController(length: sources.length, vsync: this);
      context.read<SelectedSourceCubit>().setSelectedSource(sources[0].id!);
      context.read<ArticlesCubit>().getArticles(sources[0].id!);
      tabController!.addListener(() {
        if (!tabController!.indexIsChanging) {
          final source = sources[tabController!.index];
          print('Got here');
          print(source.id!);
          context.read<ArticlesCubit>().getArticles(source.id!);
          context.read<SelectedSourceCubit>().setSelectedSource(source.id!);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return SafeArea(
      child: Padding(
        padding: REdgeInsets.all(16),
        child: Column(
          children: [
            BlocBuilder<SourcesCubit, SourcesState>(
              builder: (context, state) {
                if (state is SourcesLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is SourcesError) {
                  return Center(
                    child: Text(
                      state.message,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  );
                }

                if (state is SourcesSuccess) {
                  final sources = state.sources;

                  if (sources.isEmpty) {
                    return Text(
                      t.no_sources,
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  }

                  setupTabs(sources);

                  if (tabController == null) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return Column(
                    children: [
                      TabBar(
                        controller: tabController,
                        isScrollable: true,
                        tabs: sources.map((s) => Tab(text: s.name)).toList(),
                      ),
                      SizedBox(height: 16.h),
                    ],
                  );
                }

                return const SizedBox.shrink();
              },
            ),

            Expanded(
              child: BlocBuilder<ArticlesCubit, ArticlesState>(
                builder: (context, state) {
                  if (state is ArticlesLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is ArticlesError) {
                    return Center(child: Text(state.message));
                  }

                  if (state is ArticlesSuccess) {
                    final articles = state.articles;

                    if (articles.isEmpty) {
                      return Text(
                        t.not_available,
                        style: Theme.of(context).textTheme.headlineMedium,
                      );
                    }

                    return ListView.separated(
                      padding: EdgeInsets.all(16.w),
                      itemCount: articles.length,
                      separatorBuilder: (_, __) => SizedBox(height: 20.h),
                      itemBuilder: (_, index) {
                        return ArticleItem(article: articles[index]);
                      },
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
