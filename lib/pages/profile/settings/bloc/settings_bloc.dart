import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/pages/profile/settings/bloc/settings_event.dart';
import 'package:learning_app/pages/profile/settings/bloc/settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState()) {
    on<TriggerSettings>(_tiggerSettings);
  }

  _tiggerSettings(SettingsEvent event, Emitter<SettingsState> emit) {
    emit(const SettingsState());
  }
}
