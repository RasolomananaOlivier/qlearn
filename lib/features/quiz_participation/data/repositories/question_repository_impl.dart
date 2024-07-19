import 'package:q_learn/core/bases/base_repository.dart';
import 'package:q_learn/core/utils/resources/data_state.dart';
import 'package:q_learn/features/quiz_participation/data/datasources/remote/question_datasource.dart';
import 'package:q_learn/features/quiz_participation/domain/models/responses/questions_response.dart';
import 'package:q_learn/features/quiz_participation/domain/repositories/question_repository.dart';

class QuestionRepositoryImpl extends BaseRepository
    implements QuestionRepository {
  final QuestionDatasource _datasource;

  QuestionRepositoryImpl(this._datasource);

  @override
  Future<DataState<QuestionsResponse>> getQuestions({
    required int quizId,
  }) async {
    return getStateOf(
      request: () => _datasource.getQuestions({
        'quizId': quizId,
      }),
    );
  }
}
