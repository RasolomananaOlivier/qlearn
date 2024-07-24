import 'package:q_learn/features/answer_management/domain/models/answer.dart';
import 'package:q_learn/features/question_management/domain/models/question.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quizz_test_provider.g.dart';

@Riverpod(keepAlive: true)
class QuizzTest extends _$QuizzTest {
  @override
  List<Question> build() {
    return [];
  }

  void init(List<Question> questions) {
    state = questions
        .map((q) => Question(id: q.id, content: q.content, answers: []))
        .toList();
  }

  void giveAnswer(Question question, Answer answer) {
    List<Question> newState = [];

    for (var q in state) {
      if (q.id == question.id) {
        newState.add(
          Question(
              id: question.id, content: question.content, answers: [answer]),
        );
      } else {
        newState.add(q);
      }
    }

    state = newState;
  }

  bool isSelected(Question question, Answer answer) {
    final q = state.where((q) => q.id == question.id).firstOrNull;

    if (q == null) return false;

    return q.answers.contains(answer);
  }

  List<Map<String, int>> getResult() {
    return state
        .map(
          (question) => ({
            'questionId': question.id,
            'selectedAnswerId': question.answers.first.id
          }),
        )
        .toList();
  }
}
