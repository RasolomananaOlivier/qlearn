import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:q_learn/features/admin/presentation/widgets/create_question_form.dart';

@RoutePage()
class CreationQuestionPage extends StatelessWidget {
  const CreationQuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Creation de question'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [CreateQuestionForm()],
          ),
        ),
      ),
    );
  }
}
