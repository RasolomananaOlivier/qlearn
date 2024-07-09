import 'package:flutter/material.dart';

class CategoryFilter extends StatelessWidget {
  const CategoryFilter({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Catégories",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 5),
          buildFilters(),
        ],
      ),
    );
  }

  Widget buildFilters() {
    List<Widget> filters = ["JavaScript", "Dart", "PHP", "Java", "C++"]
        .map((category) => FilterChip(
              label: Text(category),
              selected: category == "JavaScript",
              elevation: 0,
              shape: const StadiumBorder(),
              onSelected: (value) {},
            ))
        .toList();

    return Wrap(
      spacing: 10,
      children: filters,
    );
  }
}
