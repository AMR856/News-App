import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/features/home_screen/domain/entites/article_entity.dart';
import 'package:news_app/features/home_screen/domain/repositories/articles_repoistory.dart';

@lazySingleton
class GetArticlesUseCase {
  final ArticlesRepository repository;

  GetArticlesUseCase(this.repository);

  Future<Either<String, List<ArticleEntity>>> call(
      String sourceId, {
        String? query,
      }) {
    return repository.getArticles(sourceId, query: query);
  }
}
