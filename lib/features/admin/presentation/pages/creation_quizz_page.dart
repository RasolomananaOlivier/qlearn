import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:q_learn/core/config/router/app_router.dart';

@RoutePage()
class CreationQuizzPage extends StatelessWidget {
  const CreationQuizzPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Creation Quizz'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.router.replaceAll([const AdminDashboardRoute()]);
          },
        ),
      ),
      body: const Center(
        child: Text(
          'This is the Creation Question page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
