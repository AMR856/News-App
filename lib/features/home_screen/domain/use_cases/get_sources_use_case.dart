import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/features/home_screen/domain/entites/source_entity.dart';
import 'package:news_app/features/home_screen/domain/repositories/sources_repoistory.dart';

@lazySingleton
class GetSourcesUseCase {
  final SourcesRepository repository;

  GetSourcesUseCase(this.repository);

  Future<Either<String, List<SourceEntity>>> call(String? categoryId) async {
    return repository.getSources(categoryId);
  }
}
