import 'package:dio/dio.dart' hide Headers;
import 'package:q_learn/core/utils/constants/strings.dart';
import 'package:q_learn/features/features_nyandriax/quiz_management/domain/models/responses/get_quizzes_response.dart';
import 'package:retrofit/retrofit.dart';

part 'admin_quiz_datasource.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class AdminQuizDatasource {
  factory AdminQuizDatasource(Dio dio, {String baseUrl}) = _AdminQuizDatasource;

  @GET('/quizzes')
  Future<HttpResponse<GetQuizzesResponse>> getQuizzes();
}
