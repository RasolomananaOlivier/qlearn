import 'package:flutter/material.dart';
import 'package:q_learn/core/common/domain/models/question.dart';
import 'package:q_learn/features/quiz_participation/presentation/widgets/quizz_step.dart';

class QuizzStepper extends StatefulWidget {
  QuizzStepper({
    super.key,
    required this.questions,
    required this.controller,
  });

  List<Question> questions;
  PageController controller;

  @override
  _QuizzStepperState createState() => _QuizzStepperState();
}

class _QuizzStepperState extends State<QuizzStepper> {
  @override
  Widget build(BuildContext context) {
    List<Widget> quizzSteps = widget.questions
        .map((question) => QuizzStep(question: question))
        .toList();

    return Expanded(
      child: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: widget.controller,
        children: quizzSteps,
      ),
    );
  }
}
