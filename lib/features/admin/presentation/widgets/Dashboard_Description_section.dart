import 'package:flutter/material.dart';

class DashboardDescriptionSection extends StatelessWidget {
  const DashboardDescriptionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Hey, Henintsoa Tsilavina',
          style: TextStyle(
              fontSize: 14, color: Color.fromARGB(197, 255, 255, 255)),
        ),
        SizedBox(height: 8),
        Text(
          'How do you want to get started',
          style: TextStyle(
              fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
