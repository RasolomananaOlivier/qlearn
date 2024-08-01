import 'package:dio/dio.dart' hide Headers;
import 'package:q_learn/core/utils/constants/strings.dart';
import 'package:q_learn/features/features_nyandriax/question_management/domain/models/responses/get_questions_response.dart';
import 'package:retrofit/retrofit.dart';

part 'question_datasource.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class QuestionDatasource {
  factory QuestionDatasource(Dio dio, {String baseUrl}) = _QuestionDatasource;

  @GET('/questions')
  Future<HttpResponse<GetQuestionsResponse>> getQuestions();
}
