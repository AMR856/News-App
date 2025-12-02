import 'package:news_app/api/models/article.dart';

class ArticlesResponse {
  ArticlesResponse({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  ArticlesResponse.fromJson(Map<String, dynamic> json)
    : status = json['status'] ?? '',
      totalResults = json['totalResults'] ?? 0,
      articles =
          (json['articles'] as List<dynamic>?)
              ?.map((e) => Article.fromJson(e))
              .toList() ??
          [];

  final String status;
  final num totalResults;
  final List<Article> articles;
}


