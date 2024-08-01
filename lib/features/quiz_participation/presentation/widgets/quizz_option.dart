import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_learn/core/common/domain/models/answer.dart';
import 'package:q_learn/core/common/domain/models/question.dart';
import 'package:q_learn/features/quiz_participation/presentation/providers/quizz_test_provider.dart';

class QuizzOption extends ConsumerWidget {
  const QuizzOption({
    super.key,
    required this.question,
    required this.answer,
    required this.index,
  });

  final Question question;
  final Answer answer;
  final int index;

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
      label: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Expanded(
          child: Text(
            "$index. ${answer.content}",
            overflow: TextOverflow.visible,
            // textAlign: TextAlign.center,
            softWrap: true,
          ),
        ),
      ),
      selectedColor: Colors.blueAccent.shade400,
      shape: StadiumBorder(
        side: BorderSide(
          color: Colors.blueAccent.shade400,
        ),
      ),
      backgroundColor: Colors.white.withOpacity(0.8),
      showCheckmark: false,
      selected: isSelected,
      onSelected: (selected) => handleSelected(ref, selected),
    );
  }
}
