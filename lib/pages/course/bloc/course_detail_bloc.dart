import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/pages/course/bloc/course_detail_event.dart';
import 'package:learning_app/pages/course/bloc/course_detail_state.dart';

class CourseDetailBloc extends Bloc<CourseDetailEvent, CourseDetailState> {
  CourseDetailBloc() : super(const CourseDetailState()) {
    on<TriggerCourseDetail>(_triggerCourseDetail);
  }

  void _triggerCourseDetail(
      TriggerCourseDetail event, Emitter<CourseDetailState> emit) {
    emit(state.copyWith(courseItem: event.courseItem));
  }
}