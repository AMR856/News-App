import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/api/api_service.dart';
import 'package:news_app/api/models/sources_response.dart';

class SourcesView extends StatefulWidget {
  final String? currentCategory;

  const SourcesView({super.key, required this.currentCategory});

  @override
  State<SourcesView> createState() => _SourcesViewState();
}

class _SourcesViewState extends State<SourcesView>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  late Future<SourcesResponse?> futureSources;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: REdgeInsets.all(16),
        child: FutureBuilder<SourcesResponse?>(
          future: APIService.getSources(widget.currentCategory),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || snapshot.data == null) {
              return Center(
                child: Text(
                  "No sources found",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              );
            }

            final sources = snapshot.data!.sources;

            tabController ??= TabController(
              length: sources.length,
              vsync: this,
            );

            return Column(
              children: [
                TabBar(
                  controller: tabController,
                  isScrollable: true,
                  tabs: sources
                      .map((source) => Tab(text: source.name))
                      .toList(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
