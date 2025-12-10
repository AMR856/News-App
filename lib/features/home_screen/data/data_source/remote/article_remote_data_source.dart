import 'package:news_app/features/home_screen/data/models/articles_response.dart';

abstract class ArticleRemoteDataSource {
  Future<ArticlesResponse> getArticles(String sourceId, {String? query});
}
