import 'package:flutter/material.dart';
import 'package:q_learn/core/utils/constants/input_decoration_property.dart';

class QuizSearchBar extends StatefulWidget {
  const QuizSearchBar({
    super.key,
    required this.parentScaffoldKey,
  });

  final GlobalKey<ScaffoldState> parentScaffoldKey;

  @override
  _QuizSearchBarState createState() => _QuizSearchBarState();
}

class _QuizSearchBarState extends State<QuizSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextField(
              onTap: () => {},
              onChanged: (value) => {},
              cursorColor: const Color.fromRGBO(0, 0, 0, 0.6),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 25.0),
                hintText: 'Exemple: JavaScript, PHP ...',
                hintStyle: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
                prefixIconConstraints: const BoxConstraints(minWidth: 56),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(120.0),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(120.0),
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.black12.withAlpha(20),
                filled: true,
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: Color.fromRGBO(0, 0, 0, 0.6),
                  ),
                ),
              ),
            ),
          ),
        ),

        // Filter button
        IconButton(
          onPressed: () {
            widget.parentScaffoldKey.currentState!.openEndDrawer();
          },
          icon: const Icon(Icons.tune),
        )
      ],
    );
  }
}
