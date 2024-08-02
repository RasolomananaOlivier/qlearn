import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_learn/core/utils/resources/data_state.dart';
import 'package:q_learn/features/features_nyandriax/quiz_management/presentation/providers/quizzes_provider.dart';
import 'package:q_learn/features/features_nyandriax/quiz_management/presentation/widgets/quiz_card.dart';

class QuizList extends ConsumerWidget {
  const QuizList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizzesState = ref.watch(quizzesProvider);

    if (quizzesState.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    final quizzesValue = quizzesState.value;
    if (quizzesValue is DataFailed) {
      return Center(
        child: Text(
            "Oops! Une erreur s'est produite. Erreur : ${quizzesValue!.error}"),
      );
    }

    final quizzes = quizzesValue?.data?.quizzes ?? [];
    if (quizzes.isEmpty) {
      return const Center(
        child: Text("Oops! Aucune questionnaire n'a été trouvé."),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: quizzes.length,
      itemBuilder: (context, index) => QuizCard(quiz: quizzes[index]),
    );
  }
}
