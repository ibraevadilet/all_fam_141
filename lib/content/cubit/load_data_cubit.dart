import 'package:flutter_bloc/flutter_bloc.dart';

part 'load_data_state.dart';

class LoadDataCubit extends Cubit<LoadDataState> {
  LoadDataCubit() : super(LoadDataInitial());

  load() {
    emit(LoadDataInitial());
    emit(LoadDataInitial2());
  }
}
