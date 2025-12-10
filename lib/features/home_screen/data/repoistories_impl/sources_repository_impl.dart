import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/features/home_screen/data/data_source/remote/source_remote_data_source.dart';
import 'package:news_app/features/home_screen/domain/entites/source_entity.dart';
import 'package:news_app/features/home_screen/domain/repositories/sources_repoistory.dart';

@LazySingleton(as: SourcesRepository)
class SourcesRepositoryImpl implements SourcesRepository {
  final SourceRemoteDataSource remote;

  SourcesRepositoryImpl(this.remote);

  @override
  Future<Either<String, List<SourceEntity>>> getSources(String? categoryId) async {
    try {
      final response = await remote.getSources(categoryId);

      final sources = response.sources
          .map((model) => model.toSourceEntity())
          .toList();

      return Right(sources);

    } catch (e) {
      return Left(e.toString());
    }
  }
}
