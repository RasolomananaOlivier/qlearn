import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DifficultyAndCategory extends ConsumerStatefulWidget {
  final TextEditingController difficultyController;
  final TextEditingController categoryIdController;
  final VoidCallback onNext;
  final VoidCallback onPrevious;

  const DifficultyAndCategory({
    super.key,
    required this.difficultyController,
    required this.categoryIdController,
    required this.onNext,
    required this.onPrevious,
  });

  @override
  DifficultyAndCategoryState createState() => DifficultyAndCategoryState();
}

class DifficultyAndCategoryState extends ConsumerState<DifficultyAndCategory> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: FormBuilder(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Difficulter*',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            FormBuilderTextField(
              name: 'difficulty',
              keyboardType: TextInputType.number,
              controller: widget.difficultyController,
              decoration: const InputDecoration(
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(
                    errorText: 'Ce champ est requis'),
                FormBuilderValidators.integer(
                    errorText: 'Entrez un nombre valide'),
                FormBuilderValidators.min(1,
                    errorText: 'La valeur doit être au moins 1'),
                FormBuilderValidators.max(5,
                    errorText: 'La valeur doit être au plus 5'),
              ]),
            ),
            const SizedBox(height: 10),
            const Text(
              'Category*',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            FormBuilderDropdown(
              name: 'categoryId',
              initialValue: int.tryParse(widget.categoryIdController.text) ?? 1,
              decoration: const InputDecoration(
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              dropdownColor: Colors.white,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(
                    errorText: 'Ce champ est requis'),
              ]),
              items: [
                {
                  'id': 1,
                  'name': 'Mathématique',
                  'description': 'Description Mathématique'
                },
                {
                  'id': 2,
                  'name': 'Physique',
                  'description': 'Description Physique'
                },
                {
                  'id': 3,
                  'name': 'Informatique',
                  'description': 'Description Informatique'
                },
              ]
                  .map((category) => DropdownMenuItem(
                        value: category['id'] as int,
                        child: Text(category['name'].toString()),
                      ))
                  .toList(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
              onChanged: (value) {
                widget.categoryIdController.text = value.toString();
              },
            ),
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
                    if (_formKey.currentState?.validate() ?? false) {
                      widget.onNext();
                    }
                  },
                  child: const Text('Suivant'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
