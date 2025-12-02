import 'package:dartz/dartz.dart';
import 'package:news_app/api/api_service.dart';
import 'package:news_app/api/models/sources_response.dart';
import 'sources_repository.dart';

class SourcesRepositoryImpl implements SourcesRepository {
  @override
  Future<Either<String, SourcesResponse>> fetchSources(String? categoryId) {
    return APIService.getSources(categoryId);
  }
}