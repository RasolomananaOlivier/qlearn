import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_learn/core/utils/resources/data_state.dart';
import 'package:q_learn/features/quiz_participation/presentation/providers/quizzes_provider.dart';
import 'package:q_learn/features/quiz_participation/presentation/widgets/filter_drawer_content.dart';
import 'package:q_learn/features/quiz_participation/presentation/widgets/quiz_list.dart';
import 'package:q_learn/features/quiz_participation/presentation/widgets/quiz_search_bar.dart';
import 'package:q_learn/features/quiz_participation/presentation/widgets/welcome_header.dart';

@RoutePage()
class ClientHomePage extends ConsumerStatefulWidget {
  const ClientHomePage({super.key});

  @override
  ConsumerState<ClientHomePage> createState() => _ClientHomePageState();
}

class _ClientHomePageState extends ConsumerState<ClientHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [Container()],
        title: const WelcomeHeader(),
      ),
      endDrawer: Drawer(
        width: MediaQuery.of(context).size.width,
        shape: const ContinuousRectangleBorder(),
        child: FilterDrawerContent(
          parentScaffoldKey: _scaffoldKey,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: buildBody(),
      ),
    );
  }

  Widget buildBody() {
    final response = ref.watch(quizzesProvider);

    if (response.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (response.value != null && response.value is DataFailed) {
      return const Center(
        child: Text("Oops, un truc a mal trouvé"),
      );
    }

    final quizzes = response.value?.data?.quizzes;
    if (quizzes == null) {
      return const SizedBox();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Search bar at the top
        QuizSearchBar(
          parentScaffoldKey: _scaffoldKey,
        ),

        // Quiz category count found
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text("${quizzes.length} quizz trouvées"),
        ),
        const SizedBox(height: 20),
        // const DifficultyFilter(),

        // list
        Expanded(child: QuizList(quizzes: quizzes))
      ],
    );
  }
}
