import 'package:q_learn/core/bases/base_repository.dart';
import 'package:q_learn/core/utils/resources/data_state.dart';
import 'package:q_learn/features/answer_management/domain/models/answer.dart';
import 'package:q_learn/features/question_management/domain/models/question.dart';
import 'package:q_learn/features/quiz_management/domain/models/quiz.dart';
import 'package:q_learn/features/quiz_participation/domain/models/requests/quizzes_request.dart';
import 'package:q_learn/features/quiz_participation/domain/models/responses/quizzes_response.dart';
import 'package:q_learn/features/quiz_participation/domain/repositories/quiz_repository.dart';

class QuizRepositoryImpl extends BaseRepository implements QuizRepository {
  @override
  Future<DataState<QuizzesResponse>> getQuizzes({
    required QuizzesRequest request,
  }) {
    List<Quiz> quizzes = [
      Quiz(
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
              Answer(id: 4, content: "variable", isCorrect: false),
            ],
          ),
          Question(
            id: 2,
            content:
                "Quelle méthode est utilisée pour ajouter un élément à la fin d'un tableau??",
            answers: [
              Answer(id: 1, content: "push()", isCorrect: true),
              Answer(id: 2, content: "pop()", isCorrect: false),
              Answer(id: 3, content: "shift()", isCorrect: false),
              Answer(id: 4, content: "unshift()", isCorrect: false),
            ],
          ),
          Question(
            id: 3,
            content:
                "Comment peut-on écrire un commentaire sur une seule ligne en JavaScript?",
            answers: [
              Answer(id: 1, content: "<!-- comment -->", isCorrect: false),
              Answer(id: 2, content: "// comment", isCorrect: true),
              Answer(id: 3, content: "/* comment */", isCorrect: false),
              Answer(id: 4, content: "' comment", isCorrect: false),
            ],
          )
        ],
      ),
      Quiz(
        id: 2,
        title: "Les Fonctions en JavaScript",
        description:
            "Vérifiez vos connaissances sur les fonctions en JavaScript avec ce quiz.",
        questions: [],
      ),
      Quiz(
        id: 3,
        title: "Les Objets en JavaScript",
        description: "Testez votre compréhension des objets en JavaScript.",
        questions: [],
      )
    ];

    return Future.value(
      DataSuccess(
        data: QuizzesResponse(
          quizzes: quizzes,
        ),
      ),
    );
  }
}
