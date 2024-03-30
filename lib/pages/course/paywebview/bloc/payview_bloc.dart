import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/pages/course/paywebview/bloc/payview_event.dart';
import 'package:learning_app/pages/course/paywebview/bloc/payview_state.dart';

class PayWebViewBloc extends Bloc<PayWebViewEvent, PayWebViewState> {
  PayWebViewBloc() : super(const PayWebViewState()) {
    on<TriggerWebView>(_triggerWebView);
  }

  void _triggerWebView(TriggerWebView event, Emitter<PayWebViewState> emit) {
    emit(state.copyWith(url: event.url));
  }
}
