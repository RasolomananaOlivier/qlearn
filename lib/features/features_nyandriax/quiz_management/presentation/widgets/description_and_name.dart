import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class DescriptionAndName extends ConsumerStatefulWidget {
  final TextEditingController descriptionController;
  final TextEditingController nameController;
  final VoidCallback onNext;

  const DescriptionAndName({
    super.key,
    required this.descriptionController,
    required this.nameController,
    required this.onNext,
  });

  @override
  DescriptionAndNameState createState() => DescriptionAndNameState();
}

class DescriptionAndNameState extends ConsumerState<DescriptionAndName> {
  final _formKey = GlobalKey<FormBuilderState>();

  void _handleNext() {
    final formState = _formKey.currentState;
    if (formState != null && formState.validate()) {
      widget.onNext();
    } else {
      formState?.save();
      // _setFormErrors();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: FormBuilder(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              'Nom*',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            FormBuilderTextField(
              name: 'name',
              keyboardType: TextInputType.text,
              controller: widget.nameController,
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
            const SizedBox(height: 10),
            const Text(
              'Description*',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            FormBuilderTextField(
              name: 'description',
              keyboardType: TextInputType.multiline,
              controller: widget.descriptionController,
              minLines: 3,
              maxLines: null,
              decoration: const InputDecoration(
                hintText: 'Entrer votre description',
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
