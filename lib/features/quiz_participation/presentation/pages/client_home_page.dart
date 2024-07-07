import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:q_learn/features/quiz_participation/presentation/widgets/category_list.dart';
import 'package:q_learn/features/quiz_participation/presentation/widgets/quiz_search_bar.dart';
import 'package:q_learn/features/quiz_participation/presentation/widgets/welcome_header.dart';

@RoutePage()
class ClientHomePage extends StatelessWidget {
  const ClientHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const WelcomeHeader(),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            QuizSearchBar(),

            // Quiz category count found
            Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text("4 catégories trouvées"),
            ),
            SizedBox(height: 20),

            // Quiz category list
            Expanded(child: CategoryList()),
          ],
        ),
      ),
    );
  }
}
