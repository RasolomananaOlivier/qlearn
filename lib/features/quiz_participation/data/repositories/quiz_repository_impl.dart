import 'package:q_learn/core/bases/base_repository.dart';
import 'package:q_learn/core/utils/resources/data_state.dart';
import 'package:q_learn/features/answer_management/domain/models/answer.dart';
import 'package:q_learn/features/question_management/domain/models/question.dart';
import 'package:q_learn/features/quiz_management/domain/models/quiz.dart';
import 'package:q_learn/features/quiz_participation/data/datasources/remote/quiz_datasource.dart';
import 'package:q_learn/features/quiz_participation/domain/models/requests/quizzes_request.dart';
import 'package:q_learn/features/quiz_participation/domain/models/responses/quizzes_response.dart';
import 'package:q_learn/features/quiz_participation/domain/repositories/quiz_repository.dart';

class QuizRepositoryImpl extends BaseRepository implements QuizRepository {
  final QuizDatasource _datasource;

  QuizRepositoryImpl(this._datasource);

  @override
  Future<DataState<QuizzesResponse>> getQuizzes({
    required QuizzesRequest request,
  }) {
    return getStateOf(
      request: () => _datasource.getQuizzes(),
    );
  }
}
