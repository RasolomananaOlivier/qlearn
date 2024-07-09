import 'package:flutter/material.dart';

class DifficultyFilter extends StatefulWidget {
  const DifficultyFilter({super.key});

  @override
  _DifficultyFilterState createState() => _DifficultyFilterState();
}

class _DifficultyFilterState extends State<DifficultyFilter> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Difficulté",
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
    List<Widget> filters = [1, 2, 3, 4, 5]
        .map((index) => ChoiceChip(
              label: Text("$index étoile"),
              selected: index == 1,
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
