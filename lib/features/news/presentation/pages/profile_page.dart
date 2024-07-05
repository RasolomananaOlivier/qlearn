import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_learn/features/auth/presentation/providers/auth_provider.dart';
import 'package:oktoast/oktoast.dart';

@RoutePage()
class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  showToast('content', position: ToastPosition.bottom);
                },
                child: Text('data')),
            ElevatedButton(
                onPressed: () {
                  // Wait for 2 seconds
                  Future.delayed(const Duration(seconds: 5), () {
                    ref.read(authProvider).logout();
                  });
                },
                child: Text('logout')),
          ],
        ),
      ),
    );
  }
}
