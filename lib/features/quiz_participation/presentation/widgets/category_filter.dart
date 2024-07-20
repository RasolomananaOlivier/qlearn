import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_learn/core/common/domain/models/quiz_category.dart';
import 'package:q_learn/core/utils/resources/data_state.dart';
import 'package:q_learn/features/quiz_participation/presentation/providers/get_quizz_categories_provider.dart';

class CategoryFilter extends ConsumerStatefulWidget {
  CategoryFilter({
    super.key,
    required this.categories,
    required this.toggleCategory,
  });

  final List<int> categories;
  void Function(int category) toggleCategory;

  @override
  ConsumerState<CategoryFilter> createState() => _CategoryFilterState();
}

class _CategoryFilterState extends ConsumerState<CategoryFilter> {
  // final categories = [
  //   QuizCategory(id: 1, name: "JavaScript"),
  //   QuizCategory(id: 2, name: "Dart"),
  //   QuizCategory(id: 3, name: "PHP"),
  //   QuizCategory(id: 4, name: "Java"),
  //   QuizCategory(id: 5, name: "C++"),
  //   QuizCategory(id: 6, name: "Python"),
  //   QuizCategory(id: 7, name: "Ruby"),
  // ];

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
    final state = ref.watch(getQuizzCategoriesProvider);

    if (state is AsyncLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    final isError = state is AsyncError ||
        (state is AsyncData &&
            state.value != null &&
            state.value is DataFailed);
    if (isError) {
      return const Center(child: Text("Oops! Un truc a mal tourné"));
    }

    final categories = state.value!.data!.categories;
    List<Widget> filters = categories
        .map((category) => FilterChip(
              label: Text(category.name),
              selected: widget.categories.contains(category.id),
              elevation: 0,
              showCheckmark: false,
              shape: const StadiumBorder(),
              onSelected: (selected) {
                widget.toggleCategory(category.id);
              },
            ))
        .toList();

    return Wrap(
      spacing: 10,
      children: filters,
    );
  }
}
