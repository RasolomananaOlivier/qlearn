import 'package:flutter/material.dart';
import 'package:q_learn/features/features_nyandriax/quiz_management/presentation/pages/creation_quiz_page.dart';
import 'package:q_learn/features/features_nyandriax/quiz_management/presentation/widgets/quiz_list.dart';
// import 'package:q_learn/features/features_nyandriax/quiz_management/presentation/pages/detail_quiz_page.dart';

class ListQuizPage extends StatelessWidget {
  const ListQuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des Quizzes'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: const QuizList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CreationQuizPage(),
            ),
          );
        },
        tooltip: 'Ajouter un quiz',
        child: const Icon(Icons.add),
      ),
    );
  }
}
