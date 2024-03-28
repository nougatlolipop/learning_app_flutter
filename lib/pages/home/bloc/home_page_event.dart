import 'package:learning_app/common/entities/course.dart';

abstract class HomePageEvent {
  const HomePageEvent();
}

class HomePageDots extends HomePageEvent {
  final int index;
  const HomePageDots(this.index) : super();
}

class HomePageCourseItem extends HomePageEvent {
  HomePageCourseItem(this.courseItem);
  final List<CourseItem> courseItem;
}
