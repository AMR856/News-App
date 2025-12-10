import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/core/errors/app_exception.dart';
import 'package:news_app/features/home_screen/data/models/sources_response.dart';
import 'package:news_app/features/home_screen/data/data_source/remote/source_remote_data_source.dart';

@LazySingleton(as: SourceRemoteDataSource)
class SourceRemoteDataSourceImpl implements SourceRemoteDataSource {
  final Dio dio;
  final String baseUrl;
  final String apiKey;
  SourceRemoteDataSourceImpl({
    required this.dio,
    @Named('baseUrl') required this.baseUrl,
    @Named('apiKey') required this.apiKey,
  });

  @override
  Future<SourcesResponse> getSources(String? categoryId) async {
    try {
      final response = await dio.get(
        '$baseUrl/v2/top-headlines/sources',
        queryParameters: {
          if (categoryId != null && categoryId.isNotEmpty)
            'category': categoryId,
          'apiKey': apiKey
        },
      );
      return SourcesResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw RemoteException(message: e.response?.data['message'] ?? e.message);
    } catch (e) {
      throw RemoteException(message: 'Failed to fetch Sources');
    }
  }
}