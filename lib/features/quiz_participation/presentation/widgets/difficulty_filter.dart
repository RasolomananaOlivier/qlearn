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
          const Text("Filtrer par difficulté"),
          SizedBox(
            height: 50,
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(width: 5),
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return ChoiceChip(
                  label: Text("${index + 1} étoile"),
                  selected: index == 0,
                  elevation: 0,
                  shape: const StadiumBorder(),
                  onSelected: (value) {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
