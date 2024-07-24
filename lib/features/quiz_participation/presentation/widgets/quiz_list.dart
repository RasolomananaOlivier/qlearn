import 'package:flutter/material.dart';
import 'package:q_learn/features/quiz_management/domain/models/quiz.dart';
import 'package:q_learn/features/quiz_participation/presentation/widgets/quiz_card.dart';

class QuizList extends StatefulWidget {
  const QuizList({
    super.key,
    required this.quizzes,
  });

  final List<Quiz> quizzes;

  @override
  _QuizListState createState() => _QuizListState();
}

class _QuizListState extends State<QuizList> {
  @override
  Widget build(BuildContext context) {
    if (widget.quizzes.isEmpty) {
      return const Center(
        child: Text("Oops! Aucun quizz n'a été trouvé."),
      );
    }

    return ListView.builder(
      itemCount: widget.quizzes.length,
      itemBuilder: (context, index) {
        return QuizCard(
          quiz: widget.quizzes[index],
        );
      },
    );
  }
}
