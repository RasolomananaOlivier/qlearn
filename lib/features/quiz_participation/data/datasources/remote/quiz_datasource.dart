import 'package:dio/dio.dart' hide Headers;
import 'package:q_learn/core/utils/constants/strings.dart';
import 'package:q_learn/features/quiz_participation/domain/models/requests/submit_quizz_request.dart';
import 'package:q_learn/features/quiz_participation/domain/models/responses/submit_quizz_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:q_learn/features/quiz_participation/domain/models/responses/quizzes_response.dart';

part 'quiz_datasource.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class QuizDatasource {
  factory QuizDatasource(Dio dio, {String baseUrl}) = _QuizDatasource;

  @GET('/quizzes')
  Future<HttpResponse<QuizzesResponse>> getQuizzes(
    @Queries() Map<String, dynamic> queries,
  );

  @POST('/sessions')
  Future<HttpResponse<SubmitQuizzResponse>> submitQuizz(
    @Header('Authorization') String authorization,
    @Body() SubmitQuizzRequest body,
  );
}
