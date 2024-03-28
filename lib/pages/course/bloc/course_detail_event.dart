import 'package:learning_app/common/entities/course.dart';

abstract class CourseDetailEvent {
  const CourseDetailEvent();
}

class TriggerCourseDetail extends CourseDetailEvent {
  const TriggerCourseDetail(this.courseItem) : super();
  final CourseItem courseItem;
}
