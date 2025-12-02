import 'package:dartz/dartz.dart';
import 'package:news_app/api/api_service.dart';
import 'package:news_app/api/models/articles_response.dart';
import 'articles_repository.dart';

class ArticlesRepositoryImpl implements ArticlesRepository {
  @override
  Future<Either<String, ArticlesResponse>> fetchArticles(String? sourceId, [String? query]) {
    return APIService.getArticles(sourceId, query);
  }
}