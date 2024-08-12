import 'package:bloc/bloc.dart';

import '../constants/data_state.dart';
import '../models/app_model.dart';
import '../repositories/app_repository.dart';
import '../utils/enums.dart';

part 'app_state.dart';

part 'app_event.dart';

class AppBloc extends Bloc<AppEvent, AppState?> {
  AppRepository appRepository;

  AppBloc(this.appRepository) : super(null) {
    on<LoadData>(
      (event, emit) async {
        emit(AppDataLoading(event.whoCalledBloc));

        DataState dataState =
            await appRepository.fetchData(event.callApiFunction);

        if (dataState is DataSuccess) {
          emit(AppDataCompleted(dataState.data, event.whoCalledBloc));
        }
        if (dataState is DataFailed) {
          emit(AppDataError(event.whoCalledBloc, dataState.error!));
        }
      },
    );
    on<ReloadWidget>((event, emit) {
      emit(WidgetReloaded(event.whoCalledBloc));
    });
  }
}
