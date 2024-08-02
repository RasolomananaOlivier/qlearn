import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_learn/core/config/router/app_router.dart';
import 'package:q_learn/core/utils/resources/data_state.dart';
import 'package:q_learn/features/features_nyandriax/question_management/presentation/providers/create_question_form_provider.dart';
import 'package:q_learn/features/features_nyandriax/question_management/presentation/providers/questions_provider.dart';
import 'package:q_learn/features/features_nyandriax/question_management/presentation/providers/quizzes_provider.dart';

class CreateQuestionStepTwo extends ConsumerStatefulWidget {
  const CreateQuestionStepTwo({
    super.key,
    required this.handleNext,
    required this.handlePrevious,
  });

  final VoidCallback handleNext;
  final VoidCallback handlePrevious;

  @override
  CreateQuestionStepTwoState createState() => CreateQuestionStepTwoState();
}

class CreateQuestionStepTwoState extends ConsumerState<CreateQuestionStepTwo> {
  final _formKey = GlobalKey<FormBuilderState>();
  Future<void>? pendingCreateQuestion;
  bool operationCompleted = false;

  void handleSubmit() {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final formValues = _formKey.currentState!.value;

      ref.read(createQuestionFormProvider.notifier).setQuizId(formValues);

      final future = ref.read(questionsProvider.notifier).createQuestion();

      setState(() {
        pendingCreateQuestion = future;
      });

      backToQuestionList();
    }
  }

  void backToQuestionList() {
    context.replaceRoute(const ListQuestionRoute());
  }

  @override
  Widget build(BuildContext context) {
    final quizzesAsyncValue = ref.watch(quizzesProvider);

    if (quizzesAsyncValue.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    final quizzesResponse = quizzesAsyncValue.value;

    if (quizzesResponse == null || quizzesResponse is DataFailed) {
      return Center(
        child: Text(
            "Une erreur s'est produite. Erreur : ${quizzesResponse?.error?.message}"),
      );
    }

    final quizzes = quizzesResponse.data!.quizzes;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Selection de Questionnaire'),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_sharp),
            tooltip: 'Retour',
            onPressed: widget.handlePrevious),
      ),
      // Validate and next button
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: FutureBuilder(
            future: pendingCreateQuestion,
            builder: (context, snapshot) {
              final waiting =
                  snapshot.connectionState == ConnectionState.waiting;

              return ElevatedButton(
                onPressed: waiting ? null : handleSubmit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent.shade400,
                  minimumSize: const Size.fromHeight(44),
                ),
                child: Text(
                  waiting ? "Patientez..." : "Confirmer",
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              );
            }),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Questionnaire à laquelle appartienne la question',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              FormBuilderDropdown(
                name: 'quizId',
                decoration: const InputDecoration(
                  hintText: 'Choisir une questionnaire',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                items: quizzes
                    .map(
                      (element) => DropdownMenuItem(
                        value: element.id,
                        child: Text(element.name),
                      ),
                    )
                    .toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
