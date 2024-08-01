import 'package:q_learn/core/bases/base_repository.dart';
import 'package:q_learn/core/utils/resources/data_state.dart';
import 'package:q_learn/features/features_nyandriax/question_management/data/datasources/remote/question_datasource.dart';
import 'package:q_learn/features/features_nyandriax/question_management/domain/models/responses/get_questions_response.dart';
import 'package:q_learn/features/features_nyandriax/question_management/domain/repositories/question_repository.dart';

class QuestionRepositoryImpl extends BaseRepository
    implements QuestionRepository {
  final QuestionDatasource _datasource;

  QuestionRepositoryImpl(this._datasource);

  @override
  Future<DataState<GetQuestionsResponse>> getQuestions() {
    return getStateOf(
      request: () => _datasource.getQuestions(),
    );
  }
}
