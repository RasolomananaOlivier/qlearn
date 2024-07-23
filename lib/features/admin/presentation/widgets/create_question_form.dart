import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:q_learn/core/utils/constants/input_decoration_property.dart';

final questionFormErrorProvider = StateProvider((ref) => QuestionFormError());

class QuestionFormError {
  String? get question => null;
}

class CreateQuestionForm extends ConsumerStatefulWidget {
  const CreateQuestionForm({super.key});

  @override
  ConsumerState<CreateQuestionForm> createState() => _CreateQuestionFormState();
}

class _CreateQuestionFormState extends ConsumerState<CreateQuestionForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  final List<Widget> _responseFields = [];
  int _responseCount = 3;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _addInitialResponseFields();
  }

  void _addInitialResponseFields() {
    if (_responseFields.isEmpty) {
      // Ensure fields are added only once
      for (int i = 1; i <= _responseCount; i++) {
        _responseFields.add(_buildResponseField(i));
      }
    }
  }

  Widget _buildResponseField(int index) {
    return Padding(
      key: ValueKey('reponse_$index'), // Ajoutez une clé unique
      padding: const EdgeInsets.only(bottom: 10),
      child: FormBuilderTextField(
        name: 'reponse_$index',
        onChanged: (value) {
          // Handle value changes if necessary
        },
        decoration: InputDecoration(
          hintText: 'Reponse $index',
          border: InputDecorationProperty.border(context),
          enabledBorder: InputDecorationProperty.enabledBorder(),
        ),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          FormBuilderValidators.maxLength(100),
        ]),
      ),
    );
  }

  void _addResponseField() {
    if (_responseCount < 6) {
      setState(() {
        _responseCount++;
        _responseFields.add(_buildResponseField(_responseCount));
      });
    }
  }

  void _onSubmit() {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      // Form is valid, proceed with submission
      final formData = _formKey.currentState?.value;
      print('Form Data: $formData');
      // Handle form submission, e.g., send data to the server or navigate to another page
    } else {
      print('Form is invalid');
    }
  }

  @override
  Widget build(BuildContext context) {
    final questionFormError = ref.watch(questionFormErrorProvider);

    return FormBuilder(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Question',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                FormBuilderTextField(
                  name: 'content',
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    ref.read(questionFormErrorProvider.notifier).state =
                        QuestionFormError();
                  },
                  decoration: InputDecoration(
                    hintText: 'Entrer votre question',
                    hintStyle: InputDecorationProperty.hintStyle(),
                    border: InputDecorationProperty.border(context),
                    enabledBorder: InputDecorationProperty.enabledBorder(),
                    errorText: questionFormError.question,
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(10),
                  ]),
                ),
                const SizedBox(height: 40),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Reponse du question',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Mettez plus de reponse',
                      style: TextStyle(fontSize: 12, color: Colors.blueGrey),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                ..._responseFields,
                ElevatedButton(
                  onPressed: _addResponseField,
                  child: const Text('Ajouter un reponse'),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: _onSubmit,
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
