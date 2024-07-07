import 'package:flutter/material.dart';
import 'package:q_learn/features/quiz_participation/presentation/widgets/category_card.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return const CategoryCard();
      },
    );
  }
}
