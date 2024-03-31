import 'package:learning_app/common/entities/course.dart';
import 'package:learning_app/common/entities/lesson.dart';

abstract class CourseDetailEvent {
  const CourseDetailEvent();
}

class TriggerCourseDetail extends CourseDetailEvent {
  const TriggerCourseDetail(this.courseItem) : super();
  final CourseItem courseItem;
}

class TriggerLessonList extends CourseDetailEvent {
  const TriggerLessonList(this.lessonItem) : super();
  final List<LessonItem> lessonItem;
}
