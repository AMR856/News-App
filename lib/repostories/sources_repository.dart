import 'package:dartz/dartz.dart';
import 'package:news_app/api/models/sources_response.dart';

abstract class SourcesRepository {
  Future<Either<String, SourcesResponse>> fetchSources(String? categoryId);
}