import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:q_learn/core/common/domain/models/answer.dart';
import 'package:q_learn/core/common/domain/models/question.dart';
import 'package:q_learn/core/common/widgets/app_bar_back_button.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Détail de la question'),
        leading: const AppBarBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Question',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(question.content),
            const SizedBox(height: 16),
            Text(
              'Réponses',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            buildAnswers(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget buildAnswers() {
    return Expanded(
      child: ListView.builder(
        itemCount: question.answers.length,
        itemBuilder: (context, index) {
          return buildAnswerDetail(
            question.answers[index],
          );
        },
      ),
    );
  }

  Widget buildAnswerDetail(Answer answer) {
    return Card(
      color: Colors.blueGrey.shade50,
      elevation: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(answer.content),
            const SizedBox(height: 10),
            Text('Bonne réponse : ${answer.isCorrect ? 'Oui' : 'Non'}'),
          ],
        ),
      ),
    );
  }
}
