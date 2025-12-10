import 'package:dartz/dartz.dart';
import 'package:news_app/features/home_screen/domain/entites/source_entity.dart';

abstract class SourcesRepository {
  Future<Either<String, List<SourceEntity>>> getSources(String? categoryId);
}