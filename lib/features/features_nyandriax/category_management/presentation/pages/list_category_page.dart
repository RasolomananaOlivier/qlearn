import 'package:flutter/material.dart';
import 'package:q_learn/features/features_nyandriax/category_management/presentation/pages/detail_category_page.dart';
import 'package:q_learn/features/features_nyandriax/category_management/presentation/pages/creation_category_page.dart';

class ListCategoryPage extends StatelessWidget {
  final List<Map<String, dynamic>> categories;

  const ListCategoryPage({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des catégories'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                title: Text(
                  category['name'],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(category['description']),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          DetailCategoryPage(category: category),
                    ),
                  );
                },
              ),
            );
          },
        ),
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
