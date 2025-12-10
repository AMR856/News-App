import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/features/home_screen/data/data_source/remote/article_remote_data_source.dart';
import 'package:news_app/features/home_screen/domain/entites/article_entity.dart';
import 'package:news_app/features/home_screen/domain/repositories/articles_repoistory.dart';

@LazySingleton(as: ArticlesRepository)
class ArticlesRepositoryImpl implements ArticlesRepository {
  final ArticleRemoteDataSource remote;

  ArticlesRepositoryImpl(this.remote);

  @override
  Future<Either<String, List<ArticleEntity>>> getArticles(
    String sourceId, {
    String? query,
  }) async {
    try {
      final response = await remote.getArticles(sourceId, query: query);

      final articles = response.articles
          .map((model) => model.toArticleEntity())
          .toList();

      return Right(articles);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
