import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_learn/core/common/app_bar_back_button.dart';
import 'package:q_learn/core/config/router/app_router.dart';
import 'package:q_learn/features/answer_management/domain/models/answer.dart';
import 'package:q_learn/features/question_management/domain/models/question.dart';
import 'package:q_learn/features/quiz_management/domain/models/quiz.dart';
import 'package:q_learn/features/quiz_participation/presentation/providers/quizz_test_provider.dart';
import 'package:q_learn/features/quiz_participation/presentation/widgets/quizz_stepper.dart';

@RoutePage()
class QuizzPage extends ConsumerStatefulWidget {
  QuizzPage({
    super.key,
    required this.quizz,
  });

  Quiz quizz;

  @override
  _QuizzPageState createState() => _QuizzPageState();
}

class _QuizzPageState extends ConsumerState<QuizzPage> {
  int step = 1;
  final PageController controller = PageController();

  void handleClick() {
    if (step < widget.quizz.questions.length) {
      setState(() {
        step += 1;

        controller.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.linear,
        );
      });
    } else {
      // TODO: submit result to the back

      context.router.replace(const ResultRoute());
    }
  }

  bool isStepAnswered(int step) {
    final questions = ref.watch(quizzTestProvider);

    return questions[step - 1].answers.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.quizz.name),
        leading: const AppBarBackButton(
          iconData: Icons.close,
        ),
      ),

      // Validate and next button
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: ElevatedButton(
          onPressed: isStepAnswered(step) ? handleClick : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent.shade400,
            minimumSize: const Size.fromHeight(44),
          ),
          child: const Text(
            "Suivant",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),

      // Quizz page body
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Indicates the progress of the quizz
          LinearProgressIndicator(
            value: step / widget.quizz.questions.length,
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "$step/${widget.quizz.questions.length}",
              textAlign: TextAlign.end,
            ),
          ),

          // Quizz Stepper
          QuizzStepper(
            questions: widget.quizz.questions,
            controller: controller,
          ),
        ],
      ),
    );
  }
}
