import 'package:q_learn/core/common/domain/models/responses/quizz_categories_response.dart';
import 'package:q_learn/core/utils/resources/data_state.dart';
import 'package:q_learn/features/features_nyandriax/category_management/domain/models/requests/create_category_request.dart';

abstract class CategoryRepository {
  Future<DataState<QuizzCategoriesResponse>> getCategories();

  Future<void> createCategory(CreateCategoryRequest request);
}
