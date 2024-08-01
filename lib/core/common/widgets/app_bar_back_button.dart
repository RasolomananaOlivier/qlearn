import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton({
    super.key,
    this.iconData,
  });

  final IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(iconData ?? Icons.arrow_back_ios_sharp),
      tooltip: 'Retour',
      onPressed: () {
        context.router.maybePop();
      },
    );
  }
}
