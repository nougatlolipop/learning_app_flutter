import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/common/routes/routes.dart';
import 'package:learning_app/common/values/constants.dart';
import 'package:learning_app/common/widgets/base_text_widget.dart';
import 'package:learning_app/global.dart';
import 'package:learning_app/pages/application/bloc/app_bloc.dart';
import 'package:learning_app/pages/application/bloc/app_event.dart';
import 'package:learning_app/pages/home/bloc/home_page_bloc.dart';
import 'package:learning_app/pages/home/bloc/home_page_event.dart';
import 'package:learning_app/pages/profile/settings/bloc/settings_bloc.dart';
import 'package:learning_app/pages/profile/settings/bloc/settings_state.dart';
import 'package:learning_app/pages/profile/settings/widgets/settings_widgets.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  void removeUserData() {
    context.read<AppBloc>().add(const TriggerAppEvent(0));
    context.read<HomePageBloc>().add(const HomePageDots(0));
    Global.storageService.remove(AppConstans.STORAGE_USER_TOKEN_KEY);
    Global.storageService.remove(AppConstans.STORAGE_USER_PROFILE_KEY);
    Navigator.pushNamedAndRemoveUntil(
        context, AppRoutes.SIGN_IN, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Settings"),
      body: SingleChildScrollView(
        child: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            return Container(
              child: Column(
                children: [
                  settingsButton(context, removeUserData),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
