import 'package:q_learn/core/utils/resources/data_state.dart';
import 'package:q_learn/features/quiz_participation/domain/models/responses/questions_response.dart';
import 'package:q_learn/features/quiz_participation/domain/repositories/question_repository.dart';
import 'package:q_learn/locator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_questions_provider.g.dart';

@riverpod
Future<DataState<QuestionsResponse>> getQuestions(
  GetQuestionsRef ref,
  int quizId,
) async {
  final repository = locator.get<QuestionRepository>();

  final response = await repository.getQuestions(quizId: quizId);

  return response;
}
