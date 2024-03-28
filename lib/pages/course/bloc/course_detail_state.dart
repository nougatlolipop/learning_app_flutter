import 'package:learning_app/common/entities/course.dart';

class CourseDetailState {
  const CourseDetailState({this.courseItem});

  final CourseItem? courseItem;

  CourseDetailState copyWith({CourseItem? courseItem}) {
    return CourseDetailState(
      courseItem: courseItem ?? this.courseItem,
    );
  }
}
