import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:q_learn/features/features_nyandriax/question_management/domain/models/question.dart';
import 'package:q_learn/features/features_nyandriax/question_management/presentation/providers/create_question_form_provider.dart';
import 'package:q_learn/features/features_nyandriax/question_management/presentation/widgets/content_and_answer/answer_field.dart';

class CreateQuestionStepOne extends ConsumerStatefulWidget {
  const CreateQuestionStepOne({
    super.key,
    required this.handleNext,
  });

  final VoidCallback handleNext;

  @override
  CreateQuestionStepOneState createState() => CreateQuestionStepOneState();
}

class CreateQuestionStepOneState extends ConsumerState<CreateQuestionStepOne> {
  final _formKey = GlobalKey<FormBuilderState>();

  List<Answer> answers = [
    Answer(content: "test", isCorrect: true),
    Answer(content: "test", isCorrect: false),
  ];

  void handleSubmit() {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final formValues = _formKey.currentState!.value;

      ref.read(createQuestionFormProvider.notifier)
        ..setContent(formValues)
        ..setQuestions(formValues);

      widget.handleNext();
    }
  }

  void handleAddAnswer() {
    if (answers.length >= 4) return;

    setState(() {
      answers.add(
        Answer(content: "", isCorrect: false),
      );
    });
  }

  void handleDeleteAnswer(int index) {
    if (answers.length <= 2) return;

    setState(() {
      answers.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter une question'),
      ),
      // Validate and next button
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: ElevatedButton(
          onPressed: handleSubmit,
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

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FormBuilder(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text(
                  'Question*',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                FormBuilderTextField(
                  name: 'content',
                  keyboardType: TextInputType.text,
                  // controller: widget.contentController,
                  decoration: const InputDecoration(
                    hintText: 'Entrer votre question',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                  ]),
                ),
                const SizedBox(height: 40),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Réponses de la question*',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Mettez plus de réponses',
                      style: TextStyle(fontSize: 12, color: Colors.blueGrey),
                    )
                  ],
                ),
                const SizedBox(height: 8),
                ...buildAnswerFields(),
                buildAddAnswerButton(),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildAddAnswerButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: handleAddAnswer,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.blue,
            elevation: 0,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(
                color: Colors.blue,
                width: 1,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.add),
              SizedBox(width: 8),
              Text('Ajouter une réponse'),
            ],
          ),
        ),
      ],
    );
  }

  List<Widget> buildAnswerFields() {
    List<Widget> answerFields = [];

    for (var i = 0; i < answers.length; i++) {
      if (i < answers.length - 1) {
        answerFields.addAll([
          AnswerField(
            key: ValueKey(i),
            index: i,
            onRemove: () => handleDeleteAnswer(i),
          ),
          const SizedBox(height: 10),
        ]);
      } else {
        answerFields.add(
          AnswerField(
            key: ValueKey(i),
            index: i,
            onRemove: () => handleDeleteAnswer(i),
          ),
        );
      }
    }

    return answerFields;
  }
}
