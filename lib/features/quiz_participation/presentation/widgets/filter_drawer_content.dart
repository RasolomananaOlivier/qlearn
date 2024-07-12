import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_learn/features/quiz_participation/presentation/providers/categories_provider.dart';
import 'package:q_learn/features/quiz_participation/presentation/providers/difficulty_provider.dart';
import 'package:q_learn/features/quiz_participation/presentation/widgets/category_filter.dart';
import 'package:q_learn/features/quiz_participation/presentation/widgets/difficulty_filter.dart';

class FilterDrawerContent extends ConsumerWidget {
  const FilterDrawerContent({
    super.key,
    required this.parentScaffoldKey,
  });

  final GlobalKey<ScaffoldState> parentScaffoldKey;

  void applyFilter() {}

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final difficultyFilter = ref.watch(difficultyProvider);
    final categorieFilter = ref.watch(filterCategoriesProvider);

    int filterCount = categorieFilter.length;
    if (difficultyFilter != 0) {
      filterCount++;
    }

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

      // Validate and next button
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: ElevatedButton(
          onPressed: applyFilter,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent.shade400,
            minimumSize: const Size.fromHeight(44),
          ),
          child: Text(
            "Appliquer $filterCount filtres",
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
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
