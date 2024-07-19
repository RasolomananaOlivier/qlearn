import 'package:q_learn/core/utils/resources/data_state.dart';
import 'package:q_learn/features/quiz_participation/domain/models/responses/questions_response.dart';

abstract class QuestionRepository {
  Future<DataState<QuestionsResponse>> getQuestions({
    required int quizId,
  });
}