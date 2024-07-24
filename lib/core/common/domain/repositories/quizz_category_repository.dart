import 'package:q_learn/core/common/domain/models/responses/quizz_categories_response.dart';
import 'package:q_learn/core/utils/resources/data_state.dart';

abstract class QuizzCategoryRepository {
  Future<DataState<QuizzCategoriesResponse>> getQuizzCategories();
}
