import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_learn/features/quiz_participation/presentation/providers/difficulty_provider.dart';

class DifficultyFilter extends ConsumerStatefulWidget {
  const DifficultyFilter({super.key});

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
    final difficulty = ref.watch(difficultyProvider);

    List<Widget> filters = [1, 2, 3, 4, 5]
        .map((index) => ChoiceChip(
              label: Text("$index étoile"),
              selected: index == difficulty,
              elevation: 0,
              shape: const StadiumBorder(),
              showCheckmark: false,
              onSelected: (value) {
                final notifier = ref.read(difficultyProvider.notifier);

                if (value) {
                  notifier.setDifficulty(index);
                } else {
                  notifier.setDifficulty(0);
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
