import 'package:flutter/material.dart';
import 'package:q_learn/features/features_nyandriax/question_management/domain/models/question.dart';
import 'package:q_learn/features/features_nyandriax/question_management/presentation/pages/creation_question_page.dart';
import 'package:q_learn/features/features_nyandriax/question_management/presentation/pages/detail_question_page.dart';

class ListQuestionPage extends StatelessWidget {
  final List<Question> questions;

  const ListQuestionPage({super.key, required this.questions});

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: questions.length,
          itemBuilder: (context, index) {
            final question = questions[index];
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                title: Text(
                  question.content,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'Difficulté: ${question.difficulty}\nCatégorie: ${question.categoryId}',
                  style: TextStyle(color: Colors.grey[600]),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailQuestionPage(
                            question: question,
                          )));
                },
              ),
            );
          },
        ),
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
