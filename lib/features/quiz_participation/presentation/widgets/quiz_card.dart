import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_learn/core/config/router/app_router.dart';
import 'package:q_learn/core/utils/resources/data_state.dart';
import 'package:q_learn/core/common/domain/models/quiz.dart';
import 'package:q_learn/features/quiz_participation/domain/repositories/question_repository.dart';
import 'package:q_learn/features/quiz_participation/presentation/providers/quizz_test_provider.dart';
import 'package:q_learn/locator.dart';

class QuizCard extends ConsumerStatefulWidget {
  const QuizCard({
    super.key,
    required this.quiz,
  });

  final Quiz quiz;

  @override
  ConsumerState<QuizCard> createState() => _QuizCardState();
}

class _QuizCardState extends ConsumerState<QuizCard> {
  bool isLoading = false;

  void handleTap(BuildContext context) async {
    final questionRepository = locator.get<QuestionRepository>();

    setState(() {
      isLoading = true;
    });

    final response = await questionRepository.getQuestions(
      quizId: widget.quiz.id,
    );

    setState(() {
      isLoading = false;
    });

    if (response is DataFailed) {
      return;
    }

    widget.quiz.setQuestions(response.data!.questions);

    ref.read(quizzTestProvider.notifier).init(
          widget.quiz.questions,
        );

    // ignore: use_build_context_synchronously
    context.router.push(QuizzRoute(
      quizz: widget.quiz,
    ));
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
                    widget.quiz.name,
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
              initialRating: widget.quiz.difficulty,
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
            Text(widget.quiz.description),
            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: isLoading ? null : () => handleTap(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent.shade400,
              ),
              child: Text(
                isLoading ? "Patientez..." : "Passer le test",
                style: const TextStyle(
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
