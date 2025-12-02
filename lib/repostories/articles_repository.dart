import 'package:dartz/dartz.dart';
import 'package:news_app/api/models/articles_response.dart';

abstract class ArticlesRepository {
  Future<Either<String, ArticlesResponse>> fetchArticles(String? sourceId, [String? query]);
}