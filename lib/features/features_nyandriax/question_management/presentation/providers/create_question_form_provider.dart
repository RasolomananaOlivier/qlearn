import 'package:q_learn/features/features_nyandriax/question_management/domain/models/requests/create_question_request.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_question_form_provider.g.dart';

@Riverpod(keepAlive: true)
class CreateQuestionForm extends _$CreateQuestionForm {
  @override
  CreateQuestionRequest build() {
    return CreateQuestionRequest();
  }

  void setContent(Map<String, dynamic> formValues) {
    final String content = formValues['content'];

    state = CreateQuestionRequest(
      answers: state.answers,
      quizId: state.quizId,
      content: content,
    );
  }

  void setQuizId(Map<String, dynamic> formValues) {
    final int quizId = formValues['quizId'];

    state = CreateQuestionRequest(
      quizId: quizId,
      answers: state.answers,
      content: state.content,
    );
  }

  void setQuestions(Map<String, dynamic> formValues) {
    final List<Answer> questions = [];

    for (var i = 0; i < 4; i++) {
      final contentInputName = 'answer_$i';
      final isCorrectInputName = 'is_correct_$i';

      final String? content = formValues[contentInputName];
      final bool? isCorrect = formValues[isCorrectInputName];

      if (content != null) {
        questions.add(Answer(content: content, isCorrect: isCorrect ?? false));
      }
    }

    state = CreateQuestionRequest(
      answers: questions,
      quizId: state.quizId,
      content: state.content,
    );
  }

  void reset() {
    state = CreateQuestionRequest();
  }
}
