import 'package:dio/dio.dart' hide Headers;
import 'package:q_learn/core/utils/constants/strings.dart';
import 'package:q_learn/features/quiz_participation/domain/models/responses/questions_response.dart';
import 'package:retrofit/retrofit.dart';

part 'question_datasource.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class QuestionDatasource {
  factory QuestionDatasource(Dio dio, {String baseUrl}) = _QuestionDatasource;

  @POST('/sessions/start')
  Future<HttpResponse<QuestionsResponse>> getQuestions(
    @Body() Map<String, dynamic> body,
  );
}
