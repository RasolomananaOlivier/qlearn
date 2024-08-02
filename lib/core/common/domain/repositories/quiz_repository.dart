import 'package:q_learn/core/utils/resources/data_state.dart';
import 'package:q_learn/features/quiz_participation/domain/models/requests/quizzes_request.dart';
import 'package:q_learn/features/quiz_participation/domain/models/requests/submit_quizz_request.dart';
import 'package:q_learn/features/quiz_participation/domain/models/responses/quizzes_response.dart';
import 'package:q_learn/features/quiz_participation/domain/models/responses/submit_quizz_response.dart';

abstract class QuizRepository {
  Future<DataState<QuizzesResponse>> getQuizzes({
    required QuizzesRequest request,
  });

  Future<DataState<SubmitQuizzResponse>> submitQuiz({
    required SubmitQuizzRequest request,
    required String authorization,
  });
}
