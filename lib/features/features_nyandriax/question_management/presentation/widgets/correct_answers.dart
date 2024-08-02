import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CorrectAnswers extends ConsumerStatefulWidget {
  final List<TextEditingController> answerControllers;
  final List<bool> answerCorrectness;
  final VoidCallback onPrevious;
  final VoidCallback onSave;

  const CorrectAnswers({
    super.key,
    required this.answerControllers,
    required this.answerCorrectness,
    required this.onPrevious,
    required this.onSave,
  });

  @override
  CorrectAnswersState createState() => CorrectAnswersState();
}

class CorrectAnswersState extends ConsumerState<CorrectAnswers> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final nonEmptyAnswers = widget.answerControllers
        .asMap()
        .entries
        .where((entry) => entry.value.text.isNotEmpty)
        .toList();

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: FormBuilder(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Selectionner les reponses qui sont correct :',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            ...nonEmptyAnswers.map((entry) {
              final index = entry.key;
              final controller = entry.value;
              return Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    side: const BorderSide(color: Colors.blueGrey, width: 1.0)),
                elevation: 0.0,
                margin: const EdgeInsets.symmetric(vertical: 4.0),
                child: CheckboxListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                  title: Text(controller.text),
                  value: widget.answerCorrectness[index],
                  onChanged: (bool? value) {
                    setState(() {
                      widget.answerCorrectness[index] = value ?? false;
                    });
                  },
                ),
              );
            }),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.blue,
                    backgroundColor: Colors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 24.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    side:
                        const BorderSide(color: Colors.blueAccent, width: 1.0),
                  ),
                  onPressed: widget.onPrevious,
                  child: const Text('Precedent'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blue,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 24.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    side:
                        const BorderSide(color: Colors.blueAccent, width: 1.0),
                  ),
                  onPressed: () {
                    if (_formKey.currentState?.saveAndValidate() ?? false) {
                      widget.onSave();
                    }
                  },
                  child: const Text('Sauvegarder'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
