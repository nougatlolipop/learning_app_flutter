import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/pages/register/bloc/register_bloc.dart';
import 'package:learning_app/pages/sign_in/bloc/signin_bloc.dart';
import 'package:learning_app/pages/welcome/bloc/welcome_bloc.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(lazy: false, create: (context) => WelcomeBloc()),
        BlocProvider(create: (context) => SigninBloc()),
        BlocProvider(create: (context) => RegisterBloc()),
      ];
}
