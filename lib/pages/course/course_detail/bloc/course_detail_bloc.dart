import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/pages/course/course_detail/bloc/course_detail_event.dart';
import 'package:learning_app/pages/course/course_detail/bloc/course_detail_state.dart';

class CourseDetailBloc extends Bloc<CourseDetailEvent, CourseDetailState> {
  CourseDetailBloc() : super(const CourseDetailState()) {
    on<TriggerCourseDetail>(_triggerCourseDetail);
    on<TriggerLessonList>(_triggerLessonList);
  }

  void _triggerCourseDetail(
      TriggerCourseDetail event, Emitter<CourseDetailState> emit) {
    emit(state.copyWith(courseItem: event.courseItem));
  }

  void _triggerLessonList(
      TriggerLessonList event, Emitter<CourseDetailState> emit) {
    emit(state.copyWith(lessonItem: event.lessonItem));
  }
}
