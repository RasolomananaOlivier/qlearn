import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_learn/features/auth/presentation/providers/logout_provider.dart';
import 'package:q_learn/features/auth/presentation/widgets/user_header.dart';

@RoutePage()
class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  Future<void> logout() async {
    await ref.read(logoutProvider.future);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User header information
              const UserHeader(),
              const SizedBox(height: 30),

              // General information
              buildSection(
                title: "Information générale",
                iconData: Icons.account_circle_outlined,
              ),

              // Security
              buildSection(
                title: "Mot de passe",
                iconData: Icons.security_outlined,
              ),

              // Admin feature
              buildSection(
                title: "Administration",
                iconData: Icons.admin_panel_settings_outlined,
              ),

              const SizedBox(height: 30),

              // Log out button
              buildSection(
                title: "Se deconnecter",
                iconData: Icons.logout,
                onTap: logout,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSection({
    required String title,
    required IconData iconData,
    void Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Icon(iconData),
            const SizedBox(width: 8),
            Text(title),
          ],
        ),
      ),
    );
  }
}
