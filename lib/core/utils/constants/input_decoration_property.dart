import 'package:flutter/material.dart';

class InputDecorationProperty {
  static TextStyle hintStyle() {
    return const TextStyle(
      color: Colors.grey,
      fontSize: 14,
    );
  }

  static OutlineInputBorder border(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  static OutlineInputBorder enabledBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Colors.grey,
      ),
    );
  }
}
