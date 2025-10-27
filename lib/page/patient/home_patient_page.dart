import 'package:flutter/material.dart';
import 'package:physioapp/services/auth/patient/auth_patient_service.dart';
import 'package:physioapp/utils/app_routes.dart';

class HomePatientPage extends StatelessWidget {
  const HomePatientPage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthPatientService();
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton.icon(
            onPressed: () {
              auth.logout;
              Navigator.of(context).pushNamedAndRemoveUntil(
                AppRoutes.initialAppPage,
                (_) => false,
              );
            },
            label: Text('Sair'),
            icon: Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: Center(
        child: Text('Home Patient Page'),
      ),
    );
  }
}
