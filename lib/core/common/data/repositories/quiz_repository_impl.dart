import 'package:q_learn/core/bases/base_repository.dart';
import 'package:q_learn/core/utils/resources/data_state.dart';
import 'package:q_learn/core/common/data/datasources/remote/quiz_datasource.dart';
import 'package:q_learn/features/quiz_participation/domain/models/requests/quizzes_request.dart';
import 'package:q_learn/features/quiz_participation/domain/models/requests/submit_quizz_request.dart';
import 'package:q_learn/features/quiz_participation/domain/models/responses/quizzes_response.dart';
import 'package:q_learn/features/quiz_participation/domain/models/responses/submit_quizz_response.dart';
import 'package:q_learn/core/common/domain/repositories/quiz_repository.dart';

class QuizRepositoryImpl extends BaseRepository implements QuizRepository {
  final QuizDatasource _datasource;

  QuizRepositoryImpl(this._datasource);

  @override
  Future<DataState<QuizzesResponse>> getQuizzes({
    required QuizzesRequest request,
  }) {
    return getStateOf(
      request: () => _datasource.getQuizzes(
        request.toQueries(),
      ),
    );
  }

  @override
  Future<DataState<SubmitQuizzResponse>> submitQuiz({
    required SubmitQuizzRequest request,
    required String authorization,
  }) {
    return getStateOf(
      request: () => _datasource.submitQuizz(authorization, request),
    );
  }
}
