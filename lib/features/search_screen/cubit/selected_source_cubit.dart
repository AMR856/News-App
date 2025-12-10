import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class SelectedSourceCubit extends Cubit<String?> {
  SelectedSourceCubit() : super(null);

  void setSelectedSource(String sourceId) {
    print("Changing the source");
    emit(sourceId);
  }

  void clearSelectedSource() {
    emit(null);
  }
  @override
  Future<void> close() {
    print("SelectedSourceCubit is being disposed");
    return super.close();
  }
}
