import 'package:dio/dio.dart' hide Headers;
import 'package:q_learn/core/utils/constants/strings.dart';
import 'package:q_learn/features/features_nyandriax/quiz_management/domain/models/responses/get_quizzes_response.dart';
import 'package:retrofit/retrofit.dart';

part 'quiz_datasource.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class QuizDatasource {
  factory QuizDatasource(Dio dio, {String baseUrl}) = _QuizDatasource;

  @GET('/quizzes')
  Future<HttpResponse<GetQuizzesResponse>> getQuizzes();
}
