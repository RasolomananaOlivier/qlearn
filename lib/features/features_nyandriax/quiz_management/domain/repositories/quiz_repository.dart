import 'package:q_learn/core/utils/resources/data_state.dart';
import 'package:q_learn/features/features_nyandriax/quiz_management/domain/models/responses/get_quizzes_response.dart';

abstract class QuizRepository {
  Future<DataState<GetQuizzesResponse>> getQuizzes();
}
