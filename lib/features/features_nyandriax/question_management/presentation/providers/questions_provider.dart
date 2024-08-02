import 'dart:async';

import 'package:q_learn/core/utils/resources/data_state.dart';
import 'package:q_learn/features/features_nyandriax/question_management/domain/models/responses/get_questions_response.dart';
import 'package:q_learn/features/features_nyandriax/question_management/domain/repositories/question_repository.dart';
import 'package:q_learn/features/features_nyandriax/question_management/presentation/providers/create_question_form_provider.dart';
import 'package:q_learn/locator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'questions_provider.g.dart';

@riverpod
class Questions extends _$Questions {
  @override
  Future<DataState<GetQuestionsResponse>> build() async {
    final repository = locator.get<QuestionRepository>();

    return await repository.getQuestions();
  }

  Future<void> createQuestion() async {
    final request = ref.read(createQuestionFormProvider);

    final repository = locator.get<QuestionRepository>();

    await repository.createQuestion(request);

    ref.invalidateSelf();

    await future;
  }
}
