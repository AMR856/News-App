// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:news_app/core/di/di_module.dart' as _i358;
import 'package:news_app/features/home_screen/data/data_source/remote/article_api_remote_data_source.dart'
    as _i544;
import 'package:news_app/features/home_screen/data/data_source/remote/article_remote_data_source.dart'
    as _i27;
import 'package:news_app/features/home_screen/data/data_source/remote/source_api_remote_data_source.dart'
    as _i880;
import 'package:news_app/features/home_screen/data/data_source/remote/source_remote_data_source.dart'
    as _i266;
import 'package:news_app/features/home_screen/data/repoistories_impl/articles_repository_impl.dart'
    as _i547;
import 'package:news_app/features/home_screen/data/repoistories_impl/sources_repository_impl.dart'
    as _i203;
import 'package:news_app/features/home_screen/domain/repositories/articles_repoistory.dart'
    as _i996;
import 'package:news_app/features/home_screen/domain/repositories/sources_repoistory.dart'
    as _i443;
import 'package:news_app/features/home_screen/domain/use_cases/get_article_use_case.dart'
    as _i681;
import 'package:news_app/features/home_screen/domain/use_cases/get_sources_use_case.dart'
    as _i1049;
import 'package:news_app/features/home_screen/presentation/cubit/articles_cubit.dart'
    as _i926;
import 'package:news_app/features/home_screen/presentation/cubit/sources_cubit.dart'
    as _i624;
import 'package:news_app/features/home_screen/presentation/cubit/view_cubit.dart'
    as _i888;
import 'package:news_app/features/search_screen/cubit/selected_source_cubit.dart'
    as _i820;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.singleton<_i888.ViewCubit>(() => _i888.ViewCubit());
    gh.singleton<_i820.SelectedSourceCubit>(() => _i820.SelectedSourceCubit());
    gh.lazySingleton<_i361.Dio>(() => appModule.dio());
    gh.factory<String>(() => appModule.baseUrl, instanceName: 'baseUrl');
    gh.factory<String>(() => appModule.apiKey, instanceName: 'apiKey');
    gh.lazySingleton<_i27.ArticleRemoteDataSource>(
      () => _i544.ArticlesRemoteDataSourceImpl(
        dio: gh<_i361.Dio>(),
        baseUrl: gh<String>(instanceName: 'baseUrl'),
        apiKey: gh<String>(instanceName: 'apiKey'),
      ),
    );
    gh.lazySingleton<_i996.ArticlesRepository>(
      () => _i547.ArticlesRepositoryImpl(gh<_i27.ArticleRemoteDataSource>()),
    );
    gh.lazySingleton<_i266.SourceRemoteDataSource>(
      () => _i880.SourceRemoteDataSourceImpl(
        dio: gh<_i361.Dio>(),
        baseUrl: gh<String>(instanceName: 'baseUrl'),
        apiKey: gh<String>(instanceName: 'apiKey'),
      ),
    );
    gh.lazySingleton<_i681.GetArticlesUseCase>(
      () => _i681.GetArticlesUseCase(gh<_i996.ArticlesRepository>()),
    );
    gh.singleton<_i926.ArticlesCubit>(
      () => _i926.ArticlesCubit(
        getArticlesUseCase: gh<_i681.GetArticlesUseCase>(),
      ),
    );
    gh.lazySingleton<_i443.SourcesRepository>(
      () => _i203.SourcesRepositoryImpl(gh<_i266.SourceRemoteDataSource>()),
    );
    gh.lazySingleton<_i1049.GetSourcesUseCase>(
      () => _i1049.GetSourcesUseCase(gh<_i443.SourcesRepository>()),
    );
    gh.singleton<_i624.SourcesCubit>(
      () =>
          _i624.SourcesCubit(getSourcesUseCase: gh<_i1049.GetSourcesUseCase>()),
    );
    return this;
  }
}

class _$AppModule extends _i358.AppModule {}
