import 'package:flutter/material.dart';
import 'package:physioapp/services/auth/physio/auth_service.dart';
import 'package:physioapp/utils/app_routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();
    return Drawer(
      child: TextButton.icon(
        onPressed: () async {
          await authService.logout();
          // ignore: use_build_context_synchronously
          Navigator.of(context)
              .pushNamedAndRemoveUntil(AppRoutes.initialAppPage, (_) => false);
        },
        label: Text('Sair'),
        icon: Icon(
          Icons.logout_rounded,
        ),
      ),
    );
  }
}
