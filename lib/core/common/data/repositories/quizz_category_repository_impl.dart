import 'package:q_learn/core/bases/base_repository.dart';
import 'package:q_learn/core/common/data/datasources/remote/quizz_category_datasource.dart';
import 'package:q_learn/core/common/domain/models/responses/quizz_categories_response.dart';
import 'package:q_learn/core/common/domain/repositories/quizz_category_repository.dart';
import 'package:q_learn/core/utils/resources/data_state.dart';

class QuizzCategoryRepositoryImpl extends BaseRepository
    implements QuizzCategoryRepository {
  final QuizzCategoryDatasource _datasource;

  QuizzCategoryRepositoryImpl(this._datasource);

  @override
  Future<DataState<QuizzCategoriesResponse>> getQuizzCategories() {
    return getStateOf(
      request: () => _datasource.getQuizzCategories(),
    );
  }
}
