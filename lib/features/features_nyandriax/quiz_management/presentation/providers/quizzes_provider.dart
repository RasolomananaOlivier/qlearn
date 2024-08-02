import 'dart:async';

import 'package:q_learn/core/utils/resources/data_state.dart';
import 'package:q_learn/features/features_nyandriax/quiz_management/domain/models/responses/get_quizzes_response.dart';
import 'package:q_learn/features/features_nyandriax/quiz_management/domain/repositories/admin_quiz_repository.dart';
import 'package:q_learn/locator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quizzes_provider.g.dart';

@riverpod
class Quizzes extends _$Quizzes {
  @override
  Future<DataState<GetQuizzesResponse>> build() async {
    final repository = locator.get<AdminQuizRepository>();

    return await repository.getQuizzes();
  }
}
