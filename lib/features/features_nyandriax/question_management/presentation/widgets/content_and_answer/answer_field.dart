import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class AnswerField extends StatelessWidget {
  final TextEditingController controller;
  final int index;
  final VoidCallback onRemove;

  const AnswerField({
    super.key,
    required this.controller,
    required this.index,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Row(
        children: [
          Expanded(
            child: FormBuilderTextField(
              name: 'answer${index + 1}',
              keyboardType: TextInputType.text,
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Réponse ${index + 1}',
                hintStyle: const TextStyle(color: Colors.grey),
                border: const OutlineInputBorder(),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                suffixIcon: index > 0
                    ? IconButton(
                        icon: const Icon(Icons.close, color: Colors.red),
                        onPressed: onRemove,
                      )
                    : null,
              ),
              validator: FormBuilderValidators.required(),
            ),
          ),
        ],
      ),
    );
  }
}
