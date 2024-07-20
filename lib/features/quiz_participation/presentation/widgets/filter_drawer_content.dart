import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_learn/features/quiz_participation/presentation/providers/categories_provider.dart';
import 'package:q_learn/features/quiz_participation/presentation/providers/difficulty_provider.dart';
import 'package:q_learn/features/quiz_participation/presentation/providers/quizzes_provider.dart';
import 'package:q_learn/features/quiz_participation/presentation/widgets/category_filter.dart';
import 'package:q_learn/features/quiz_participation/presentation/widgets/difficulty_filter.dart';

class FilterDrawerContent extends ConsumerStatefulWidget {
  const FilterDrawerContent({
    super.key,
    required this.parentScaffoldKey,
  });

  final GlobalKey<ScaffoldState> parentScaffoldKey;

  @override
  ConsumerState<FilterDrawerContent> createState() =>
      _FilterDrawerContentState();
}

class _FilterDrawerContentState extends ConsumerState<FilterDrawerContent> {
  late int localDifficulty;
  late List<int> localCategories;

  void closeDrawer() {
    widget.parentScaffoldKey.currentState!.closeEndDrawer();
  }

  void applyFilter() {
    ref.read(difficultyProvider.notifier).setDifficulty(localDifficulty);
    ref.read(filterCategoriesProvider.notifier).setCategories(localCategories);
    ref.read(quizzesProvider.notifier).invalidate();

    closeDrawer();
  }

  void setDifficulty(int difficulty) {
    setState(() {
      localDifficulty = difficulty;
    });
  }

  void toggleCategory(int category) {
    setState(() {
      if (localCategories.contains(category)) {
        localCategories = localCategories.where((c) => c != category).toList();
      } else {
        localCategories = [...localCategories, category];
      }
    });
  }

  @override
  void initState() {
    super.initState();

    localDifficulty = ref.read(difficultyProvider);
    localCategories = ref.read(filterCategoriesProvider);
  }

  @override
  Widget build(BuildContext context) {
    int filterCount = 0;
    filterCount = localCategories.length;

    if (localDifficulty != 0) {
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
              onPressed: closeDrawer,
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

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Filter by difficulty
              DifficultyFilter(
                difficulty: localDifficulty,
                setDifficulty: setDifficulty,
              ),
              const SizedBox(height: 10),

              // Filter by categories
              CategoryFilter(
                categories: localCategories,
                toggleCategory: toggleCategory,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
