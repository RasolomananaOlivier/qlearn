import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:q_learn/features/auth/presentation/widgets/user_header.dart';

@RoutePage()
class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
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
                "Information générale",
                Icons.account_circle_outlined,
              ),

              // Security
              buildSection(
                "Mot de passe",
                Icons.security_outlined,
              ),

              // Admin feature
              buildSection(
                "Administration",
                Icons.admin_panel_settings_outlined,
              ),

              const SizedBox(height: 30),

              // Log out button
              buildSection(
                "Se deconnecter",
                Icons.logout,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSection(String title, IconData iconData) {
    return InkWell(
      onTap: () {},
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
