import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:q_learn/core/common/domain/models/question.dart';

@RoutePage()
class DetailQuestionPage extends StatelessWidget {
  final Question question;

  const DetailQuestionPage({
    super.key,
    required this.question,
  });

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmer la suppression'),
          content:
              const Text('Êtes-vous sûr de vouloir supprimer cette question ?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Ferme la boîte de dialogue
              },
              child: const Text('Annuler'),
            ),
            TextButton(
              onPressed: () {
                // Ajouter la logique de suppression ici
                Navigator.of(context).pop(); // Ferme la boîte de dialogue
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Question supprimée')),
                );
              },
              child: const Text('Supprimer'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final String content = question.content;
    final List<dynamic> answers = question.answers;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Détail de la question'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Question: $content',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // Text(
            //   'Difficulté: $difficulty',
            //   style: Theme.of(context)
            //       .textTheme
            //       .titleMedium
            //       ?.copyWith(color: Colors.grey[700]),
            // ),
            // const SizedBox(height: 8),
            // Text(
            //   'Catégorie ID: $categoryId',
            //   style: Theme.of(context)
            //       .textTheme
            //       .titleMedium
            //       ?.copyWith(color: Colors.grey[700]),
            // ),
            const SizedBox(height: 16),
            const Text(
              'Réponses:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // Flexible(
            //   child: ListView.builder(
            //     itemCount: answers.length,
            //     itemBuilder: (context, index) {
            //       final answer = answers[index];
            //       final answerText =
            //           answer is Answer ? answer.content : answer.toString();
            //       final isCorrect = answer is Answer ? answer.isCorrect : false;

            //       return Card(
            //         color: isCorrect ? Colors.green : Colors.blue,
            //         child: Container(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Center(
            //             child: Text(
            //               answerText,
            //               style: const TextStyle(
            //                 color: Colors.white,
            //               ),
            //             ),
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => CreationQuestionPage(
                    //       question: question,
                    //     ),
                    //   ),
                    // );
                  },
                  child: const Text('Modifier'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _showDeleteConfirmationDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: const Text('Supprimer'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
