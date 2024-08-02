import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_learn/core/utils/resources/data_state.dart';
import 'package:q_learn/features/features_nyandriax/category_management/presentation/providers/categories_provider.dart';
import 'package:q_learn/features/features_nyandriax/category_management/presentation/widgets/category_card.dart';

class CategoryList extends ConsumerWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesState = ref.watch(categoriesProvider);

    if (categoriesState.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    final categoriesValue = categoriesState.value;
    if (categoriesValue is DataFailed) {
      return Center(
        child: Text(
            "Oops! Une erreur s'est produite. Erreur : ${categoriesValue!.error}"),
      );
    }

    final categories = categoriesValue?.data?.categories ?? [];
    if (categories.isEmpty) {
      return const Center(
        child: Text("Oops! Aucune question n'a été trouvé."),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: categories.length,
      itemBuilder: (context, index) =>
          CategoryCard(category: categories[index]),
    );
  }
}
