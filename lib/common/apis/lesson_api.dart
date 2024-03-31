import 'package:learning_app/common/entities/entities.dart';
import 'package:learning_app/common/utils/http_util.dart';

class LessonApi {
  static Future<LessonListResponseEntity> lessonList(
      {LessonRequestEntity? params}) async {
    var response = await HttpUtil().post(
      'api/lessonList',
      queryParameters: params?.toJson(),
    );

    return LessonListResponseEntity.fromJson(response);
  }

  static Future<LessonDetailResponseEntity> lessonDetail(
      {LessonRequestEntity? params}) async {
    var response = await HttpUtil().post(
      'api/lessonDetail',
      queryParameters: params?.toJson(),
    );

    return LessonDetailResponseEntity.fromJson(response);
  }
}
