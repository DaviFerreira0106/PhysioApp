import 'dart:io';

import 'package:flutter/material.dart';
import 'package:physioapp/services/auth/physio/auth_physio_service.dart';
import 'package:physioapp/services/navigation/bottom_nav_bar_controller.dart';
import 'package:physioapp/utils/app_routes.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = AuthPhysioService();
    final currentPage = Provider.of<BottomNavBarPhysioController>(context);

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
              function: () => currentPage.toggleIndex(index: 3),
            ),
            Divider(
              color: Colors.grey[300],
            ),
            _componentDrawer(
              icon: Icons.person_add_alt_1_rounded,
              title: 'Adicionar Paciente',
              function: () =>
                  Navigator.of(context).pushNamed(AppRoutes.addPatientPage),
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
