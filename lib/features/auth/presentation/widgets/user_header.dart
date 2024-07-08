import 'package:flutter/material.dart';

class UserHeader extends StatefulWidget {
  const UserHeader({super.key});

  @override
  _UserHeaderState createState() => _UserHeaderState();
}

class _UserHeaderState extends State<UserHeader> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Rasolomanana Olivier",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 2.5),
        Text(
          "olivier@gmail.com",
          style: TextStyle(
            fontSize: 14,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
