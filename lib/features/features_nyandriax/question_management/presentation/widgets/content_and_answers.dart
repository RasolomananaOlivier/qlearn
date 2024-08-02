import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:q_learn/features/features_nyandriax/question_management/presentation/providers/content_and_answers_providers.dart';
import 'package:q_learn/features/features_nyandriax/question_management/presentation/widgets/content_and_answer/answer_field.dart';

class ContentAndAnswers extends ConsumerStatefulWidget {
  final TextEditingController contentController;
  final List<TextEditingController> answerControllers;
  final VoidCallback onNext;

  const ContentAndAnswers({
    super.key,
    required this.contentController,
    required this.answerControllers,
    required this.onNext,
  });

  @override
  ContentAndAnswersState createState() => ContentAndAnswersState();
}

class ContentAndAnswersState extends ConsumerState<ContentAndAnswers> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
    // Initialiser le nombre de réponses basé sur le nombre de contrôleurs fournis
    if (widget.answerControllers.isEmpty) {
      widget.answerControllers
          .add(TextEditingController(text: 'Réponse initiale 0'));
    }
  }

  void _handleNext() {
    final formState = _formKey.currentState;
    if (formState != null && formState.validate()) {
      widget.onNext();
    } else {
      formState?.save();
      _setFormErrors();
    }
  }

  void _setFormErrors() {
    final formState = _formKey.currentState;
    if (formState != null) {
      final contentError = formState.fields['content']?.errorText ?? '';
      ref
          .read(contentAndAnswersFormErrorsProvider.notifier)
          .setContentError(contentError);
    }
  }

  void _addAnswer() {
    if (widget.answerControllers.length < 4) {
      setState(() {
        widget.answerControllers.add(TextEditingController());
      });
    }
  }

  void _removeAnswer(int index) {
    if (widget.answerControllers.length > 1) {
      setState(() {
        widget.answerControllers.removeAt(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final formErrors = ref.watch(contentAndAnswersFormErrorsProvider);

    return Padding(
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
            FormBuilderTextField(
              name: 'content',
              keyboardType: TextInputType.text,
              controller: widget.contentController,
              decoration: InputDecoration(
                hintText: 'Entrer votre question',
                hintStyle: const TextStyle(color: Colors.grey),
                border: const OutlineInputBorder(),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                errorText: formErrors.contentError.isNotEmpty
                    ? formErrors.contentError
                    : null,
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
                  'Réponse de la question*',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Mettez plus de réponses',
                  style: TextStyle(fontSize: 12, color: Colors.blueGrey),
                )
              ],
            ),
            ...List.generate(
              widget.answerControllers.length,
              (index) => AnswerField(
                key: ValueKey(index),
                // controller: widget.answerControllers[index],
                index: index,
                onRemove: () => _removeAnswer(index),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: _addAnswer,
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _handleNext,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 24.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  side: const BorderSide(color: Colors.blueAccent, width: 1.0),
                ),
                child: const Text(
                  'Suivant',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
