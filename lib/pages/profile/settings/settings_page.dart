import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/common/values/constants.dart';
import 'package:learning_app/global.dart';
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
    Global.storageService.remove(AppConstans.STORAGE_USER_TOKEN_KEY);
    Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
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
