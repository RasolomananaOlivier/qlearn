import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:q_learn/core/config/router/app_router.dart';
import 'package:q_learn/features/quiz_management/domain/models/quiz.dart';

class QuizCard extends StatelessWidget {
  const QuizCard({
    super.key,
    required this.quiz,
  });

  final Quiz quiz;

  void handleTap(BuildContext context) {
    context.router.push(const QuizzRoute());
  }

  @override
  Widget build(BuildContext context) {
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
                    quiz.title,
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
              initialRating: 2,
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
              onPressed: () => handleTap(context),
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
