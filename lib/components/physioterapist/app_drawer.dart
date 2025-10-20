import 'dart:io';

import 'package:flutter/material.dart';
import 'package:physioapp/services/auth/physio/auth_service.dart';
import 'package:physioapp/utils/app_routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = AuthService();

    Widget _userComponentDrawer(
        {required String name,
        required String email,
        required File imageProfile}) {
      return Container(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: FileImage(imageProfile),
            maxRadius: 30,
          ),
          title: Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            email,
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary, fontSize: 14),
          ),
        ),
      );
    }

    Widget _componentDrawer(
        {required IconData icon,
        required String title,
        required Function() function}) {
      return ListTile(
        leading: Icon(icon),
        title: Text(title),
        onTap: function,
      );
    }

    return SafeArea(
      child: Drawer(
        child: Column(
          children: [
            _userComponentDrawer(
              name: authService.currentPhysioUser!.userName,
              email: authService.currentPhysioUser!.email,
              imageProfile: authService.currentPhysioUser!.imageProfile,
            ),
            Divider(
              color: Colors.grey[300],
            ),
            _componentDrawer(
              icon: Icons.account_circle_rounded,
              title: 'Minha Conta',
              function: () => Navigator.of(context)
                  .pushReplacementNamed(AppRoutes.physioProfilePage),
            ),
            Divider(
              color: Colors.grey[300],
            ),
            _componentDrawer(
                icon: Icons.logout_rounded,
                title: 'Sair',
                function: () async {
                  await authService.logout();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    AppRoutes.initialAppPage,
                    (_) => false,
                  );
                }),
          ],
        ),
      ),
    );
  }
}
