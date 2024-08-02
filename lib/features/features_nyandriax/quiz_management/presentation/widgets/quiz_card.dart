// import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:q_learn/core/common/domain/models/quiz.dart';
// import 'package:q_learn/core/config/router/app_router.dart';

class QuizCard extends StatelessWidget {
  const QuizCard({super.key, required this.quiz});

  final Quiz quiz;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.blueGrey.shade50,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              quiz.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
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
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent.shade400,
              ),
              child: const Text(
                "Voir les détails",
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
