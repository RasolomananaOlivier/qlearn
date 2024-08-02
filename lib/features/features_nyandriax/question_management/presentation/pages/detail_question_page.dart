import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:q_learn/core/common/domain/models/answer.dart';
import 'package:q_learn/core/common/domain/models/question.dart';
import 'package:q_learn/core/common/widgets/app_bar_back_button.dart';

@RoutePage()
class DetailQuestionPage extends StatefulWidget {
  final Question question;

  const DetailQuestionPage({
    super.key,
    required this.question,
  });

  @override
  State<DetailQuestionPage> createState() => _DetailQuestionPageState();
}

class _DetailQuestionPageState extends State<DetailQuestionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Détail de la question'),
        leading: const AppBarBackButton(),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
              Text(widget.question.content),
              const SizedBox(height: 16),
              Text(
                'Réponses',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ...buildAnswers(),
              const SizedBox(height: 16),
              ...buildStatics(),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buildAnswers() {
    return [
      ...List.generate(
        widget.question.answers.length,
        (index) => buildAnswerDetail(
          widget.question.answers[index],
        ),
      )
    ];
  }

  Widget buildAnswerDetail(Answer answer) {
    return Card(
      color: Colors.blueGrey.shade50,
      elevation: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        width: MediaQuery.of(context).size.width,
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

  Widget buildStat(String title, {dynamic value = 0.0}) {
    return Card(
      color: Colors.blueGrey.shade50,
      elevation: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            const SizedBox(height: 10),
            Text(
              '${value ?? 0}',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildStatics() {
    return [
      Text(
        'Statistiques',
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 8),
      buildStat(
        "Nombre de fois où la question a été répondue",
        value: widget.question.count?.count,
      ),
      const SizedBox(height: 8),
      buildStat(
        "Nombre de fois où la question a été correctement répondue",
        value: widget.question.count?.success,
      ),
      const SizedBox(height: 8),
      buildStat(
        "Pourcentage de succès",
        value: widget.question.count?.rate,
      ),
    ];
  }
}
