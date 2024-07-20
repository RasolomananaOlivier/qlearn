import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_learn/features/quiz_participation/presentation/providers/difficulty_provider.dart';

class DifficultyFilter extends ConsumerStatefulWidget {
  DifficultyFilter({
    super.key,
    required this.difficulty,
    required this.setDifficulty,
  });

  final int? difficulty;
  void Function(int category) setDifficulty;

  @override
  _DifficultyFilterState createState() => _DifficultyFilterState();
}

class _DifficultyFilterState extends ConsumerState<DifficultyFilter> {
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
              selected: index == widget.difficulty,
              elevation: 0,
              shape: const StadiumBorder(),
              showCheckmark: false,
              onSelected: (value) {
                if (value) {
                  widget.setDifficulty(index);
                } else {
                  widget.setDifficulty(0);
                }
              },
            ))
        .toList();

    return Wrap(
      spacing: 10,
      children: filters,
    );
  }
}
