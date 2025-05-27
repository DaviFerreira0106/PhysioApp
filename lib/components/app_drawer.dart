import 'package:flutter/material.dart';
import 'package:physioapp/controller/auth_controller.dart';
import 'package:physioapp/controller/user_fisio_controller.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthController>(context);
    final user = Provider.of<UserFisioController>(context);
    return Drawer(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Ola! ${user.fisioUser.name}',
                    style: const TextStyle(fontSize: 26),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: TextButton.icon(
                onPressed: () => auth.logout(),
                label: const Text(
                  'Sair',
                  style: TextStyle(fontSize: 18),
                ),
                icon: const Icon(Icons.exit_to_app, size: 25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
