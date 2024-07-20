import 'dart:async';

import 'package:q_learn/core/common/domain/models/responses/quizz_categories_response.dart';
import 'package:q_learn/core/common/domain/repositories/quizz_category_repository.dart';
import 'package:q_learn/core/utils/resources/data_state.dart';
import 'package:q_learn/locator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_quizz_categories_provider.g.dart';

@riverpod
Future<DataState<QuizzCategoriesResponse>> getQuizzCategories(
    GetQuizzCategoriesRef ref) async {
  final repository = locator.get<QuizzCategoryRepository>();

  return await repository.getQuizzCategories();
}
