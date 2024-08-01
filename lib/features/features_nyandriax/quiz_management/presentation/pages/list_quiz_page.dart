import 'package:flutter/material.dart';
import 'package:q_learn/features/features_nyandriax/quiz_management/domain/models/quiz.dart';
import 'package:q_learn/features/features_nyandriax/quiz_management/presentation/pages/creation_quiz_page.dart';
import 'package:q_learn/features/features_nyandriax/quiz_management/presentation/pages/detail_quiz_page.dart';

class ListQuizPage extends StatelessWidget {
  final List<Quiz> quizzes;

  const ListQuizPage({super.key, required this.quizzes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des quiz'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: quizzes.length,
          itemBuilder: (context, index) {
            final quiz = quizzes[index];
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                contentPadding: const EdgeInsets.all(16.0),
                title: Text(
                  quiz.name,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      quiz.description,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      'Difficulté: ${quiz.difficulty}',
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      'Catégorie ID: ${quiz.categoryId}',
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetailQuizPage(quiz: quiz),
                    ),
                  );
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
