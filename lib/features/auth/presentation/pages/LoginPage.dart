import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_learn/features/auth/presentation/providers/auth_provider.dart';

@RoutePage()
class LoginPage extends ConsumerWidget {
  const LoginPage({
    Key? key,
    required this.onResult,
  }) : super(key: key);

  final void Function(bool) onResult;

  void _handleLogin(WidgetRef ref) {
    ref.read(authProvider).login();

    onResult(true);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _handleLogin(ref),
          child: const Text('Login'),
        ),
      ),
    );
  }
}
