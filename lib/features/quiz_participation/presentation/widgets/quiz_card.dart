import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_learn/core/config/router/app_router.dart';
import 'package:q_learn/features/quiz_management/domain/models/quiz.dart';
import 'package:q_learn/features/quiz_participation/presentation/providers/quizz_test_provider.dart';

class QuizCard extends ConsumerWidget {
  const QuizCard({
    super.key,
    required this.quiz,
  });

  final Quiz quiz;

  void handleTap(BuildContext context, WidgetRef ref) {
    if (quiz.questions.isEmpty) return;

    ref.read(quizzTestProvider.notifier).init(
          quiz.questions,
        );

    context.router.push(QuizzRoute(
      quizz: quiz,
    ));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      color: Colors.blueGrey.shade50,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category name and forward arrow
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    quiz.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Difficulty Rating
            RatingBar.builder(
              itemCount: 5,
              initialRating: quiz.difficulty,
              ignoreGestures: true,
              itemSize: 18,
              itemBuilder: (context, index) {
                return const Icon(
                  Icons.star,
                  color: Colors.blue,
                );
              },
              onRatingUpdate: (value) {},
            ),
            const SizedBox(height: 10),

            // Quizzes count
            Text(quiz.description),
            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () => handleTap(context, ref),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent.shade400,
              ),
              child: const Text(
                "Passer le test",
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
