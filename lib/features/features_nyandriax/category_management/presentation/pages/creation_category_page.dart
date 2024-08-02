import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

@RoutePage()
class CreationCategoryPage extends ConsumerStatefulWidget {
  final Map<String, dynamic>? category;

  const CreationCategoryPage({super.key, this.category});

  @override
  ConsumerState<CreationCategoryPage> createState() =>
      _CreationCategoryPageState();
}

class _CreationCategoryPageState extends ConsumerState<CreationCategoryPage> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
    // Initialize form fields with data if category is provided
    if (widget.category != null) {
      _formKey.currentState?.patchValue({
        'name': widget.category!['name'],
        'description': widget.category!['description'],
      });
    }
  }

  void _submitForm() {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      // Form is valid, handle the data
      final formData = _formKey.currentState?.value;
      if (widget.category != null) {
        // Update existing category
        print("Update category with data: $formData");
      } else {
        // Create new category
        print("Create new category with data: $formData");
      }

      // Perform actions such as saving to a database

      Navigator.of(context).pop();
    } else {
      // Form is invalid, show errors
      print("Form validation failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.category != null ? 'Modifier Catégorie' : 'Créer Catégorie'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
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
                initialValue: widget.category?['name'],
                decoration: const InputDecoration(
                  hintText: 'Entrer le nom de la catégorie',
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              const SizedBox(height: 25),
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
                keyboardType: TextInputType.text,
                minLines: 3,
                maxLines: null,
                initialValue: widget.category?['description'],
                decoration: const InputDecoration(
                  hintText: 'Entrer la description de la catégorie',
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
                  onPressed: _submitForm,
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
                  child: Text(
                    widget.category != null ? 'Modifier' : 'Créer',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
