import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_learn/core/config/router/app_router.dart';
import 'package:q_learn/core/utils/resources/data_state.dart';
import 'package:q_learn/features/quiz_management/domain/models/quiz.dart';
import 'package:q_learn/features/quiz_participation/presentation/providers/submit_quizz_provider.dart';

@RoutePage()
class ResultPage extends ConsumerStatefulWidget {
  ResultPage({
    super.key,
    required this.quizz,
  });

  Quiz quizz;

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends ConsumerState<ResultPage> {
  void handleClick() {
    context.router.replaceAll([const ClientHomeRoute()]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Validate and next button
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: ElevatedButton(
          onPressed: handleClick,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent.shade400,
            minimumSize: const Size.fromHeight(44),
          ),
          child: const Text(
            "Retour à l'acceuil",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SafeArea(child: buildBody()),
    );
  }

  Widget buildBody() {
    final submitQuizz = ref.watch(submitQuizzProvider(widget.quizz.id));

    if (submitQuizz.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    final response = submitQuizz.value;
    if (response is DataFailed) {
      return const Center(child: Text("Ooops! Une erreur s'est produite"));
    }

    final session = response?.data?.session;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Correct answers
          const Text(
            "Votre Score",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          Text(
            // "75%",
            session?.getPercentage() ?? "",
            style: TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent.shade400,
            ),
          ),

          const SizedBox(height: 20),

          // Incorrect answers
          SizedBox(
            width: 250,
            child: Text(
              session?.getResultMessage() ?? "",
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
