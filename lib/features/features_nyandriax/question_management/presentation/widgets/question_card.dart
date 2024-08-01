import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:q_learn/core/common/domain/models/question.dart';
import 'package:q_learn/core/config/router/app_router.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({super.key, required this.question});

  final Question question;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.blueGrey.shade50,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              question.content,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => context.pushRoute(
                DetailQuestionRoute(
                  question: question,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent.shade400,
              ),
              child: const Text(
                "Voir",
                style: TextStyle(
                  color: Colors.white,
                  // decoration: TextDecoration.underline,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
