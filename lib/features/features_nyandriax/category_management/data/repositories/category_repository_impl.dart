import 'package:q_learn/core/bases/base_repository.dart';
import 'package:q_learn/core/common/domain/models/responses/quizz_categories_response.dart';
import 'package:q_learn/core/utils/resources/data_state.dart';
import 'package:q_learn/features/features_nyandriax/category_management/data/datasources/remote/category_datasource.dart';
import 'package:q_learn/features/features_nyandriax/category_management/domain/models/requests/create_category_request.dart';
import 'package:q_learn/features/features_nyandriax/category_management/domain/repositories/category_repository.dart';

class CategoryRepositoryImpl extends BaseRepository
    implements CategoryRepository {
  final CategoryDatasource _datasource;

  CategoryRepositoryImpl(this._datasource);

  @override
  Future<DataState<QuizzCategoriesResponse>> getCategories() {
    return getStateOf(
      request: () => _datasource.getCategories(),
    );
  }

  @override
  Future<void> createCategory(CreateCategoryRequest request) {
    return getStateOf(
      request: () => _datasource.createCategory(request),
    );
  }
}
