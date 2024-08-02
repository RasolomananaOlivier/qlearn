import 'dart:async';

import 'package:q_learn/core/common/domain/models/responses/quizz_categories_response.dart';
import 'package:q_learn/core/utils/resources/data_state.dart';
import 'package:q_learn/features/features_nyandriax/category_management/domain/models/requests/create_category_request.dart';
import 'package:q_learn/features/features_nyandriax/category_management/domain/repositories/category_repository.dart';
import 'package:q_learn/locator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'categories_provider.g.dart';

@riverpod
class Categories extends _$Categories {
  @override
  Future<DataState<QuizzCategoriesResponse>> build() async {
    final repository = locator.get<CategoryRepository>();

    return await repository.getCategories();
  }

  Future<void> createCategory(String name) async {
    final repository = locator.get<CategoryRepository>();

    final future = repository.createCategory(
      CreateCategoryRequest(name: name),
    );

    ref.invalidateSelf();

    await future;
  }
}
