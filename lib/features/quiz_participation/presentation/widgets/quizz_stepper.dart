import 'package:flutter/material.dart';
import 'package:q_learn/features/question_management/domain/models/question.dart';
import 'package:q_learn/features/quiz_participation/presentation/widgets/quizz_step.dart';

class QuizzStepper extends StatefulWidget {
  QuizzStepper({
    super.key,
    required this.questions,
  });

  List<Question> questions;

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
      child: PageView(children: quizzSteps),
    );
  }
}
