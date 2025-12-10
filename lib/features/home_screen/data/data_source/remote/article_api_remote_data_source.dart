import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/core/errors/app_exception.dart';
import 'package:news_app/features/home_screen/data/data_source/remote/article_remote_data_source.dart';
import 'package:news_app/features/home_screen/data/models/articles_response.dart';

@LazySingleton(as: ArticleRemoteDataSource)
class ArticlesRemoteDataSourceImpl implements ArticleRemoteDataSource {
  final Dio dio;
  final String baseUrl;
  final String apiKey;

  ArticlesRemoteDataSourceImpl({
    required this.dio,
    @Named('baseUrl') required this.baseUrl,
    @Named('apiKey') required this.apiKey,
  });

  @override
  Future<ArticlesResponse> getArticles(String sourceId, {String? query}) async {
    try {
      final response = await dio.get(
        '$baseUrl/v2/top-headlines',
        queryParameters: {
          'sources': sourceId,
          'apiKey': apiKey,
          if (query != null && query.isNotEmpty) 'q': query,
        },
      );
      return ArticlesResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw RemoteException(message: e.response?.data['message'] ?? e.message);
    } catch (e) {
      throw RemoteException(message: 'Failed to fetch articles');
    }
  }
}
