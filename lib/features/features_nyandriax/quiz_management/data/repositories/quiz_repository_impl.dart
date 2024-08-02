import 'package:q_learn/core/bases/base_repository.dart';
import 'package:q_learn/core/utils/resources/data_state.dart';
import 'package:q_learn/features/features_nyandriax/quiz_management/data/datasources/remote/quiz_datasource.dart';
import 'package:q_learn/features/features_nyandriax/quiz_management/domain/models/responses/get_quizzes_response.dart';
import 'package:q_learn/features/features_nyandriax/quiz_management/domain/repositories/quiz_repository.dart';

class QuizRepositoryImpl extends BaseRepository implements QuizRepository {
  final QuizDatasource _datasource;

  QuizRepositoryImpl(this._datasource);

  @override
  Future<DataState<GetQuizzesResponse>> getQuizzes() {
    return getStateOf(
      request: () => _datasource.getQuizzes(),
    );
  }
}
