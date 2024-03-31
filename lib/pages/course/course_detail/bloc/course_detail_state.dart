import 'package:learning_app/common/entities/course.dart';
import 'package:learning_app/common/entities/entities.dart';

class CourseDetailState {
  const CourseDetailState({
    this.lessonItem = const <LessonItem>[],
    this.courseItem,
  });

  final CourseItem? courseItem;
  final List<LessonItem> lessonItem;

  CourseDetailState copyWith({
    CourseItem? courseItem,
    List<LessonItem>? lessonItem,
  }) {
    return CourseDetailState(
      courseItem: courseItem ?? this.courseItem,
      lessonItem: lessonItem ?? this.lessonItem,
    );
  }
}
