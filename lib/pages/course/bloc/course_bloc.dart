import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/pages/course/bloc/course_event.dart';
import 'package:learning_app/pages/course/bloc/course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  CourseBloc() : super(const CourseState()) {
    on<TriggerCourse>(_triggerCourse);
  }

  void _triggerCourse(TriggerCourse event, Emitter<CourseState> emit) {
    emit(state.copyWith(courseItem: event.courseItem));
  }
}
