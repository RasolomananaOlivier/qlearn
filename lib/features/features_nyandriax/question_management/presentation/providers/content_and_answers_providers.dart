import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_learn/features/features_nyandriax/question_management/presentation/providers/creation_question/content_and_answers_form_errors.dart';

class ContentAndAnswersFormErrorsNotifier
    extends StateNotifier<ContentAndAnswersFormErrors> {
  ContentAndAnswersFormErrorsNotifier() : super(ContentAndAnswersFormErrors());

  void setContentError(String error) {
    state = ContentAndAnswersFormErrors(contentError: error);
  }
}

final contentAndAnswersFormErrorsProvider = StateNotifierProvider<
    ContentAndAnswersFormErrorsNotifier, ContentAndAnswersFormErrors>(
  (ref) => ContentAndAnswersFormErrorsNotifier(),
);
