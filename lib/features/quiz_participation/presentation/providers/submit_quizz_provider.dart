import 'package:q_learn/core/utils/resources/data_state.dart';
import 'package:q_learn/features/auth/presentation/providers/auth_provider.dart';
import 'package:q_learn/features/quiz_participation/domain/models/requests/submit_quizz_request.dart';
import 'package:q_learn/features/quiz_participation/domain/models/responses/submit_quizz_response.dart';
import 'package:q_learn/features/quiz_participation/domain/repositories/quiz_repository.dart';
import 'package:q_learn/features/quiz_participation/presentation/providers/quizz_test_provider.dart';
import 'package:q_learn/locator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'submit_quizz_provider.g.dart';

@riverpod
Future<DataState<SubmitQuizzResponse>> submitQuizz(
  SubmitQuizzRef ref,
  int quizId,
) async {
  final repository = locator.get<QuizRepository>();

  final request = SubmitQuizzRequest(
    quizId: quizId,
    sessionAnswers: ref.read(quizzTestProvider.notifier).getResult(),
  );

  final authState = ref.read(authProvider).value;
  if (authState?.user == null || authState?.token == null) {
    return Future.error("User not log in");
  }

  final response = await repository.submitQuiz(
    request: request,
    authorization: authState!.token!.getAuthorization(),
  );

  return response;
}
