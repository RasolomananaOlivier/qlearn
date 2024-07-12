import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_learn/features/answer_management/domain/models/answer.dart';
import 'package:q_learn/features/question_management/domain/models/question.dart';
import 'package:q_learn/features/quiz_participation/presentation/providers/quizz_test_provider.dart';

class QuizzOption extends ConsumerWidget {
  const QuizzOption({
    super.key,
    required this.question,
    required this.answer,
  });

  final Question question;
  final Answer answer;

  void handleSelected(WidgetRef ref, bool selected) {
    ref.read(quizzTestProvider.notifier).giveAnswer(
          question,
          answer,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(quizzTestProvider);

    bool isSelected = ref.read(quizzTestProvider.notifier).isSelected(
          question,
          answer,
        );

    return ChoiceChip(
      label: SizedBox(
        width: MediaQuery.of(context).size.width * 0.30,
        child: Text(
          answer.content,
          textAlign: TextAlign.center,
        ),
      ),
      showCheckmark: false,
      selected: isSelected,
      onSelected: (selected) => handleSelected(ref, selected),
    );
  }
}
