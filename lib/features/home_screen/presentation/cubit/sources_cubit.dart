import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app/features/home_screen/domain/entites/source_entity.dart';
import 'package:news_app/features/home_screen/domain/use_cases/get_sources_use_case.dart';

@Singleton()
class SourcesCubit extends Cubit<SourcesState> {
  final GetSourcesUseCase getSourcesUseCase;

  SourcesCubit({required this.getSourcesUseCase}) : super(SourcesInitial());

  Future<void> getSources(String? categoryId) async {
    emit(SourcesLoading());

    final result = await getSourcesUseCase.call(categoryId);

    result.fold(
          (failure) => emit(SourcesError(failure)),
          (sources) => emit(SourcesSuccess(sources)),
    );
  }
  @override
  Future<void> close() {
    print("SourcesCubit is being disposed");
    return super.close();
  }
}


abstract class SourcesState {}

class SourcesInitial extends SourcesState {}

class SourcesLoading extends SourcesState {}

class SourcesSuccess extends SourcesState {
  final List<SourceEntity> sources;

  SourcesSuccess(this.sources);
}

class SourcesError extends SourcesState {
  final String message;

  SourcesError(this.message);
}
