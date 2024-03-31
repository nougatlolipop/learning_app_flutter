import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:learning_app/common/apis/course_api.dart';
import 'package:learning_app/common/apis/lesson_api.dart';
import 'package:learning_app/common/entities/course.dart';
import 'package:learning_app/common/entities/lesson.dart';
import 'package:learning_app/common/routes/routes.dart';
import 'package:learning_app/common/widgets/flutter_toast.dart';
import 'package:learning_app/pages/course/course_detail/bloc/course_detail_bloc.dart';
import 'package:learning_app/pages/course/course_detail/bloc/course_detail_event.dart';

class CourseDetailController {
  final BuildContext context;

  CourseDetailController({required this.context});

  void init() async {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    asyncLoadCourseData(args['id']);
    asyncLoadLessonData(args['id']);
  }

  asyncLoadCourseData(int? id) async {
    CourseRequestEntity courseRequestEntity = CourseRequestEntity();
    courseRequestEntity.id = id;
    var result = await CourseApi.courseDetail(params: courseRequestEntity);

    if (result.code == 200) {
      if (context.mounted) {
        context.read<CourseDetailBloc>().add(TriggerCourseDetail(result.data!));
      } else {}
    } else {
      toastInfo(msg: "Something went wrong");
    }
  }

  asyncLoadLessonData(int? id) async {
    LessonRequestEntity lessonRequestEntity = LessonRequestEntity();
    lessonRequestEntity.id = id;
    var result = await LessonApi.lessonList(params: lessonRequestEntity);

    if (result.code == 200) {
      if (context.mounted) {
        context.read<CourseDetailBloc>().add(TriggerLessonList(result.data!));
      } else {}
    } else {
      toastInfo(msg: "Something went wrong");
    }
  }

  void goBuy(int? id) async {
    EasyLoading.show(
      indicator: const CircularProgressIndicator(),
      maskType: EasyLoadingMaskType.clear,
      dismissOnTap: true,
    );
    CourseRequestEntity courseRequestEntity = CourseRequestEntity();
    courseRequestEntity.id = id;
    var result = await CourseApi.coursePay(params: courseRequestEntity);
    EasyLoading.dismiss();
    if (result.code == 200) {
      var url = Uri.decodeFull(result.data!);
      var res = await Navigator.of(context)
          .pushNamed(AppRoutes.PAY_WEB_VIEW, arguments: {"url": url});

      if (res == 'success') {
        toastInfo(msg: "You bought is successful");
      }
    } else {
      toastInfo(msg: result.msg!);
    }
  }
}
