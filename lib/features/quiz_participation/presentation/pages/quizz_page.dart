import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:q_learn/core/common/app_bar_back_button.dart';
import 'package:q_learn/core/config/router/app_router.dart';
import 'package:q_learn/features/answer_management/domain/models/answer.dart';
import 'package:q_learn/features/question_management/domain/models/question.dart';
import 'package:q_learn/features/quiz_management/domain/models/quiz.dart';
import 'package:q_learn/features/quiz_participation/presentation/widgets/quizz_stepper.dart';

@RoutePage()
class QuizzPage extends StatefulWidget {
  const QuizzPage({super.key});

  @override
  _QuizzPageState createState() => _QuizzPageState();
}

class _QuizzPageState extends State<QuizzPage> {
  int step = 1;
  final PageController controller = PageController();

  Quiz quiz = Quiz(
    id: 1,
    title: "Introduction au JavaScript",
    description:
        "Testez vos connaissances de base en JavaScript avec ce quiz introductif.",
    questions: [
      Question(
        id: 1,
        content:
            "Quel mot-clé est utilisé pour déclarer une variable en JavaScript?",
        answers: [
          Answer(id: 1, content: "var", isCorrect: true),
          Answer(id: 2, content: "let", isCorrect: false),
          Answer(id: 3, content: "const", isCorrect: false),
          Answer(id: 1, content: "variable", isCorrect: false),
        ],
      ),
      Question(
        id: 1,
        content:
            "Quelle méthode est utilisée pour ajouter un élément à la fin d'un tableau??",
        answers: [
          Answer(id: 1, content: "push()", isCorrect: true),
          Answer(id: 2, content: "pop()", isCorrect: false),
          Answer(id: 3, content: "shift()", isCorrect: false),
          Answer(id: 1, content: "unshift()", isCorrect: false),
        ],
      ),
      Question(
        id: 1,
        content:
            "Comment peut-on écrire un commentaire sur une seule ligne en JavaScript?",
        answers: [
          Answer(id: 1, content: "<!-- comment -->", isCorrect: false),
          Answer(id: 2, content: "// comment", isCorrect: true),
          Answer(id: 3, content: "/* comment */", isCorrect: false),
          Answer(id: 1, content: "' comment", isCorrect: false),
        ],
      )
    ],
  );

  void handleClick() {
    if (step < quiz.questions.length) {
      setState(() {
        step += 1;

        controller.nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.linear,
        );
      });
    } else {
      context.router.replace(const ResultRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(quiz.title),
        leading: const AppBarBackButton(
          iconData: Icons.close,
        ),
      ),

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
            value: step / quiz.questions.length,
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "$step/${quiz.questions.length}",
              textAlign: TextAlign.end,
            ),
          ),

          // Quizz Stepper
          QuizzStepper(questions: quiz.questions, controller: controller),
        ],
      ),
    );
  }
}
