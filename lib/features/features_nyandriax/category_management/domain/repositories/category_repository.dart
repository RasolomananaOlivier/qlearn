import 'package:q_learn/core/utils/resources/data_state.dart';
import 'package:q_learn/features/features_nyandriax/category_management/domain/models/responses/get_categories_response.dart';

abstract class CategoryRepository {
  Future<DataState<GetCategoriesResponse>> getCategories();
}
