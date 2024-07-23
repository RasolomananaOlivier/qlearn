import 'package:flutter/material.dart';

class DashboardCategoryList extends StatelessWidget {
  final List<String> categories;

  const DashboardCategoryList({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFEAEAEA)),
              borderRadius: BorderRadius.circular(4.0),
            ),
            margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
            child: ListTile(
              title: Text(categories[index]),
              onTap: () {
                // Handle category click
              },
            ),
          );
        },
      ),
    );
  }
}
