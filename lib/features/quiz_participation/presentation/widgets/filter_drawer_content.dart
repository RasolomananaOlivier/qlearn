import 'package:flutter/material.dart';
import 'package:q_learn/features/quiz_participation/presentation/widgets/category_filter.dart';
import 'package:q_learn/features/quiz_participation/presentation/widgets/difficulty_filter.dart';

class FilterDrawerContent extends StatelessWidget {
  const FilterDrawerContent({
    super.key,
    required this.parentScaffoldKey,
  });

  final GlobalKey<ScaffoldState> parentScaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Filtres",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          // Close drawer
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: () {
                parentScaffoldKey.currentState!.closeEndDrawer();
              },
              icon: const Icon(Icons.close),
            ),
          )
        ],
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Filter by difficulty
              DifficultyFilter(),
              SizedBox(height: 10),

              // Filter by categories
              CategoryFilter(),
            ],
          ),
        ),
      ),
    );
  }
}
