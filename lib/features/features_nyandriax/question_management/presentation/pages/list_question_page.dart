import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:q_learn/features/features_nyandriax/question_management/presentation/pages/creation_question_page.dart';
import 'package:q_learn/features/features_nyandriax/question_management/presentation/widgets/question_list.dart';

@RoutePage()
class ListQuestionPage extends StatelessWidget {
  const ListQuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des Questions'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: QuestionList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CreationQuestionPage(),
            ),
          );
        },
        tooltip: 'Ajouter une question',
        child: const Icon(Icons.add),
      ),
    );
  }
}
