import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/pages/application/bloc/app_event.dart';
import 'package:learning_app/pages/application/bloc/app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    on<TriggerAppEvent>((event, emit) {
      emit(AppState(index: event.index));
    });
  }
}
