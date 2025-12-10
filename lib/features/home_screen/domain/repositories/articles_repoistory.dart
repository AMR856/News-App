import 'package:dartz/dartz.dart';
import 'package:news_app/features/home_screen/domain/entites/article_entity.dart';

abstract class ArticlesRepository {
  Future<Either<String, List<ArticleEntity>>> getArticles(
      String sourceId, {
        String? query,
      });
}