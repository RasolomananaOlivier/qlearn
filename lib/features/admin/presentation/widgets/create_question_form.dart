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
  final List<String> _visibleResponseFields = [];
  int _responseCount = 1;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _addInitialResponseField();
  }

  void _addInitialResponseField() {
    if (_responseFields.isEmpty) {
      // Add only one default field
      _responseFields.add(_buildResponseField(1, removable: false));
    }
  }

  Widget _buildResponseField(int index, {bool removable = true}) {
    final fieldName = 'reponse_$index';
    if (!_visibleResponseFields.contains(fieldName)) {
      _visibleResponseFields.add(fieldName);
    }
    return Padding(
      key: ValueKey(fieldName),
      padding: const EdgeInsets.only(bottom: 10),
      child: Stack(
        children: [
          FormBuilderTextField(
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
          if (removable)
            Positioned(
              right: 0,
              top: 0,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.red),
                onPressed: () {
                  setState(() {
                    _visibleResponseFields.remove(fieldName);
                    _removeResponseField(index);
                  });
                },
              ),
            ),
        ],
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

  void _removeResponseField(int index) {
    setState(() {
      _responseFields.removeWhere(
        (field) => (field.key as ValueKey).value == 'reponse_$index',
      );
      // Update the keys of the remaining fields
      for (int i = index + 1; i <= _responseCount; i++) {
        final fieldIndex = i - 1;
        final oldField = _responseFields.firstWhere(
          (field) => (field.key as ValueKey).value == 'reponse_$i',
        );
        _responseFields.remove(oldField);
        _responseFields.insert(fieldIndex - 1, _buildResponseField(fieldIndex));
      }
      _responseCount--;
    });
  }

  void _onSubmit() {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      final formData = _formKey.currentState?.value;
      final filteredFormData = {
        'content': formData?['content'],
      };
      for (var field in _visibleResponseFields) {
        if (formData?.containsKey(field) ?? false) {
          filteredFormData[field] = formData?[field];
        }
      }
      print('Filtered Form Data: $filteredFormData');
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
                const SizedBox(height: 5),
                ..._responseFields,
                const SizedBox(height: 5),
                Center(
                  child: ElevatedButton(
                    onPressed: _addResponseField,
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.add),
                        SizedBox(width: 8),
                        Text('Ajouter un reponse'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _onSubmit,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                elevation: 0,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Enregistrer',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
