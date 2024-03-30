import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/common/routes/names.dart';
import 'package:learning_app/global.dart';
import 'package:learning_app/pages/application/application_page.dart';
import 'package:learning_app/pages/application/bloc/app_bloc.dart';
import 'package:learning_app/pages/course/course_detail/bloc/course_detail_bloc.dart';
import 'package:learning_app/pages/course/course_detail/course_detail.dart';
import 'package:learning_app/pages/course/paywebview/bloc/payview_bloc.dart';
import 'package:learning_app/pages/course/paywebview/paywebview.dart';
import 'package:learning_app/pages/home/bloc/home_page_bloc.dart';
import 'package:learning_app/pages/home/home_page.dart';
import 'package:learning_app/pages/profile/settings/bloc/settings_bloc.dart';
import 'package:learning_app/pages/profile/settings/settings_page.dart';
import 'package:learning_app/pages/register/bloc/register_bloc.dart';
import 'package:learning_app/pages/register/register.dart';
import 'package:learning_app/pages/sign_in/bloc/signin_bloc.dart';
import 'package:learning_app/pages/sign_in/sign_in.dart';
import 'package:learning_app/pages/welcome/bloc/welcome_bloc.dart';
import 'package:learning_app/pages/welcome/welcome.dart';

class AppPages {
  static List<PageIdentity> routes() {
    return [
      PageIdentity(
        route: AppRoutes.INITIAL,
        page: const Welcome(),
        bloc: BlocProvider(create: (_) => WelcomeBloc()),
      ),
      PageIdentity(
        route: AppRoutes.SIGN_IN,
        page: const SignIn(),
        bloc: BlocProvider(create: (_) => SigninBloc()),
      ),
      PageIdentity(
        route: AppRoutes.REGISTER,
        page: const Register(),
        bloc: BlocProvider(create: (_) => RegisterBloc()),
      ),
      PageIdentity(
        route: AppRoutes.APPLICATION,
        page: const ApplicationPage(),
        bloc: BlocProvider(create: (_) => AppBloc()),
      ),
      PageIdentity(
        route: AppRoutes.HOME_PAGE,
        page: const HomePage(),
        bloc: BlocProvider(create: (_) => HomePageBloc()),
      ),
      PageIdentity(
        route: AppRoutes.SETTINGS,
        page: const SettingPage(),
        bloc: BlocProvider(create: (_) => SettingsBloc()),
      ),
      PageIdentity(
        route: AppRoutes.COURSE_DETAIL,
        page: const CourseDetail(),
        bloc: BlocProvider(create: (_) => CourseDetailBloc()),
      ),
      PageIdentity(
        route: AppRoutes.PAY_WEB_VIEW,
        page: const PayWebView(),
        bloc: BlocProvider(create: (_) => PayWebViewBloc()),
      ),
    ];
  }

  static List<dynamic> allBlocProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.INITIAL && deviceFirstOpen) {
          bool isLoggedIn = Global.storageService.getIsLoggedId();

          if (isLoggedIn) {
            return MaterialPageRoute(
              builder: (_) => const ApplicationPage(),
              settings: settings,
            );
          }

          return MaterialPageRoute(
            builder: (_) => const SignIn(),
            settings: settings,
          );
        }
        return MaterialPageRoute(
          builder: (_) => result.first.page,
          settings: settings,
        );
      }
    }
    return MaterialPageRoute(
        builder: (_) => const SignIn(), settings: settings);
  }
}

class PageIdentity {
  String route;
  Widget page;
  dynamic bloc;

  PageIdentity({
    required this.route,
    required this.page,
    this.bloc,
  });
}
