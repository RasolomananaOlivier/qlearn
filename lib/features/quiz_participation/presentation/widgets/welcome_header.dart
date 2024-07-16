import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_learn/features/auth/presentation/providers/auth_provider.dart';

class WelcomeHeader extends ConsumerWidget {
  const WelcomeHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Bienvenue dans Q-learn",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent.shade700,
          ),
        ),
        Text(
          "${ref.watch(authProvider).user?.fullName}",
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 16,
          ),
        )
      ],
    );
  }
}
