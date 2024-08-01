import 'package:q_learn/core/utils/resources/data_state.dart';
import 'package:q_learn/features/features_nyandriax/question_management/domain/models/responses/get_questions_response.dart';

abstract class QuestionRepository {
  Future<DataState<GetQuestionsResponse>> getQuestions();
}