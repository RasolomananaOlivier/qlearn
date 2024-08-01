import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_learn/core/utils/resources/data_state.dart';
import 'package:q_learn/features/features_nyandriax/question_management/presentation/providers/questions_provider.dart';
import 'package:q_learn/features/features_nyandriax/question_management/presentation/widgets/question_card.dart';

class QuestionList extends ConsumerWidget {
  const QuestionList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questionsState = ref.watch(questionsProvider);

    if (questionsState.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    final questionsValue = questionsState.value;
    if (questionsValue is DataFailed) {
      return Center(
        child: Text(
            "Oops! Une erreur s'est produite. Erreur : ${questionsValue?.error}"),
      );
    }

    final questions = questionsValue?.data?.questions ?? [];
    if (questions.isEmpty) {
      return const Center(
        child: Text("Oops! Aucune question n'a été trouvé."),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: questions.length,
      itemBuilder: (context, index) => QuestionCard(question: questions[index]),
    );
  }
}
