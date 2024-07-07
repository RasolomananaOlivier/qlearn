import 'package:q_learn/core/utils/resources/data_state.dart';
import 'package:q_learn/features/quiz_participation/domain/models/requests/quizzes_request.dart';
import 'package:q_learn/features/quiz_participation/domain/models/responses/quizzes_response.dart';

abstract class QuizRepository {
  Future<DataState<QuizzesResponse>> getQuizzes({
    required QuizzesRequest request,
  });
}
