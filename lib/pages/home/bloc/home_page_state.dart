import 'package:learning_app/common/entities/course.dart';

class HomePageState {
  final int index;
  const HomePageState({
    this.courseItem = const <CourseItem>[],
    this.index = 0,
  });

  final List<CourseItem> courseItem;
  HomePageState copyWith({int? index, List<CourseItem>? courseItem}) {
    return HomePageState(
      index: index ?? this.index,
      courseItem: courseItem ?? this.courseItem,
    );
  }
}
