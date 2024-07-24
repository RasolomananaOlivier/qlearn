import 'package:q_learn/core/utils/resources/data_state.dart';
import 'package:q_learn/features/quiz_participation/domain/models/requests/quizzes_request.dart';
import 'package:q_learn/features/quiz_participation/domain/models/responses/quizzes_response.dart';
import 'package:q_learn/features/quiz_participation/domain/repositories/quiz_repository.dart';
import 'package:q_learn/features/quiz_participation/presentation/providers/categories_provider.dart';
import 'package:q_learn/features/quiz_participation/presentation/providers/difficulty_provider.dart';
import 'package:q_learn/locator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quizzes_provider.g.dart';

@riverpod
class Quizzes extends _$Quizzes {
  @override
  Future<DataState<QuizzesResponse>> build() async {
    final difficulty = ref.read(difficultyProvider);
    final categoryIds = ref.read(filterCategoriesProvider);

    final response = await locator<QuizRepository>().getQuizzes(
      request: QuizzesRequest(
        difficulty: difficulty == 0 ? null : difficulty,
        categoryIds: categoryIds,
      ),
    );

    return response;
  }

  void invalidate() {
    ref.invalidateSelf();
  }
}
