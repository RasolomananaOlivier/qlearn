import 'package:flutter/material.dart';
import 'package:q_learn/features/features_nyandriax/category_management/presentation/pages/creation_category_page.dart';
import 'package:q_learn/features/features_nyandriax/category_management/presentation/widgets/category_list.dart';

class ListCategoryPage extends StatelessWidget {
  const ListCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des Catégories'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: CategoryList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CreationCategoryPage(),
            ),
          );
        },
        tooltip: 'Ajouter une catégorie',
        child: const Icon(Icons.add),
      ),
    );
  }
}
