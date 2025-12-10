import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/features/home_screen/domain/entites/article_entity.dart';
import 'package:news_app/features/home_screen/domain/use_cases/get_article_use_case.dart';

@Singleton()
class ArticlesCubit extends Cubit<ArticlesState> {
  final GetArticlesUseCase getArticlesUseCase;

  ArticlesCubit({required this.getArticlesUseCase}) : super(ArticlesInitial());

  Future<void> getArticles(String sourceId, {String? query}) async {
    emit(ArticlesLoading());

    final result = await getArticlesUseCase.call(sourceId, query: query);

    result.fold(
          (failure) => emit(ArticlesError(failure)),
          (articles) => emit(ArticlesSuccess(articles)),
    );
  }
  @override
  Future<void> close() {
    print("ArticlesCubit is being disposed");
    return super.close();
  }
}

abstract class ArticlesState {}

class ArticlesInitial extends ArticlesState {}

class ArticlesLoading extends ArticlesState {}

class ArticlesSuccess extends ArticlesState {
  final List<ArticleEntity> articles;

  ArticlesSuccess(this.articles);
}

class ArticlesError extends ArticlesState {
  final String message;

  ArticlesError(this.message);
}
