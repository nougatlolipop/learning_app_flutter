import 'package:learning_app/common/entities/entities.dart';
import 'package:learning_app/common/utils/http_util.dart';

class CourseApi {
  static Future<CourseListResponseEntity> courseList() async {
    var response = await HttpUtil().post(
      'api/courseList',
    );

    return CourseListResponseEntity.fromJson(response);
  }
}
