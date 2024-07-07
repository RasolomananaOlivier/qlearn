import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_learn/core/common/app_bar_back_button.dart';
import 'package:q_learn/core/utils/resources/data_state.dart';
import 'package:q_learn/features/quiz_management/domain/models/quiz.dart';
import 'package:q_learn/features/quiz_participation/domain/models/responses/quizzes_response.dart';
import 'package:q_learn/features/quiz_participation/presentation/providers/quizzes_provider.dart';
import 'package:q_learn/features/quiz_participation/presentation/widgets/difficulty_filter.dart';
import 'package:q_learn/features/quiz_participation/presentation/widgets/quiz_list.dart';

@RoutePage()
class QuizListPage extends ConsumerStatefulWidget {
  const QuizListPage({super.key});

  @override
  _QuizListPageState createState() => _QuizListPageState();
}

class _QuizListPageState extends ConsumerState<QuizListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JavaScript"),
        leading: const AppBarBackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: buildBody(),
      ),
    );
  }

  Widget buildBody() {
    AsyncValue<DataState<QuizzesResponse>> response =
        ref.watch(quizzesProvider);

    if (response.isLoading) {
      return const CircularProgressIndicator();
    }

    if (response.value != null && response.value is DataFailed) {
      return const Center(
        child: Text("Oops, un truc a mal trouvé"),
      );
    }

    List<Quiz>? quizzes = response.value?.data?.quizzes;
    if (quizzes == null) {
      return const SizedBox();
    }

    return Column(
      children: [
        // Filter
        const DifficultyFilter(),

        // list
        Expanded(child: QuizList(quizzes: quizzes))
      ],
    );
  }
}
