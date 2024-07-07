import 'package:flutter/material.dart';
import 'package:q_learn/features/answer_management/domain/models/answer.dart';

class QuizzOption extends StatelessWidget {
  const QuizzOption({
    super.key,
    required this.answer,
  });

  final Answer answer;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: SizedBox(
        width: MediaQuery.of(context).size.width * 0.30,
        child: Text(
          answer.content,
          textAlign: TextAlign.center,
        ),
      ),
      showCheckmark: false,
      selected: false,
      onSelected: (value) {},
    );
  }
}
