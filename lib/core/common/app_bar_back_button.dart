import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios_sharp),
      tooltip: 'Retour',
      onPressed: () {
        context.router.maybePop();
      },
    );
  }
}
