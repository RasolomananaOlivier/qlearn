import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:q_learn/core/config/router/app_router.dart';
import 'package:q_learn/features/features_nyandriax/category_management/presentation/providers/categories_provider.dart';

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
      ref
          .read(categoriesProvider.notifier)
          .createCategory(_formKey.currentState?.value['name']);

      context.replaceRoute(const ListCategoryRoute());
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

      // Validate and next button
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: ElevatedButton(
          onPressed: _submitForm,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent.shade400,
            minimumSize: const Size.fromHeight(44),
          ),
          child: const Text(
            "Ajouter",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
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
                'Nom de la catégorie',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
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
            ],
          ),
        ),
      ),
    );
  }
}
