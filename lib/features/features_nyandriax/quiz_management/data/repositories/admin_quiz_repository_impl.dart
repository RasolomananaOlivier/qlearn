import 'package:q_learn/core/bases/base_repository.dart';
import 'package:q_learn/core/utils/resources/data_state.dart';
import 'package:q_learn/features/features_nyandriax/quiz_management/data/datasources/remote/admin_quiz_datasource.dart';
import 'package:q_learn/features/features_nyandriax/quiz_management/domain/models/responses/get_quizzes_response.dart';
import 'package:q_learn/features/features_nyandriax/quiz_management/domain/repositories/admin_quiz_repository.dart';

class AdminQuizRepositoryImpl extends BaseRepository
    implements AdminQuizRepository {
  final AdminQuizDatasource _datasource;

  AdminQuizRepositoryImpl(this._datasource);

  @override
  Future<DataState<GetQuizzesResponse>> getQuizzes() {
    return getStateOf(
      request: () => _datasource.getQuizzes(),
    );
  }
}
