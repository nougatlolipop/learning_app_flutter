import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/common/apis/course_api.dart';
import 'package:learning_app/common/entities/user.dart';
import 'package:learning_app/global.dart';
import 'package:learning_app/pages/home/bloc/home_page_bloc.dart';
import 'package:learning_app/pages/home/bloc/home_page_event.dart';

class HomeController {
  late BuildContext context;
  UserItem get userProfile => Global.storageService.getUserProfile();

  static final HomeController _singleton = HomeController._external();

  HomeController._external();

  factory HomeController({required BuildContext context}) {
    _singleton.context = context;
    return _singleton;
  }

  Future<void> init() async {
    if (Global.storageService.getUserToken().isNotEmpty) {
      var result = await CourseApi.courseList();
      if (result.code == 200) {
        if (context.mounted) {
          context.read<HomePageBloc>().add(HomePageCourseItem(result.data!));
        }
      } else {
        print(result.code);
      }
    } else {
      print("User has already logged out");
    }
  }
}
