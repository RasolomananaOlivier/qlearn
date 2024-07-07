import 'package:flutter/material.dart';
import 'package:q_learn/features/question_management/domain/models/question.dart';
import 'package:q_learn/features/quiz_participation/presentation/widgets/quizz_option.dart';

class QuizzStep extends StatelessWidget {
  const QuizzStep({
    super.key,
    required this.question,
  });

  final Question question;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
      child: Column(
        children: [
          // Question
          Text(
            question.content,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 10),

          // Answer options
          buildOptions(),
        ],
      ),
    );
  }

  Widget buildOptions() {
    List<Widget> quizzOptions =
        question.answers.map((answer) => QuizzOption(answer: answer)).toList();

    return Wrap(
      direction: Axis.horizontal,
      spacing: 16,
      children: quizzOptions,
    );
  }
}
