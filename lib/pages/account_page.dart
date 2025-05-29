import 'package:flutter/material.dart';
import 'package:physioapp/components/app_drawer.dart';
import 'package:physioapp/components/settings_account_form.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações de Conta'),
      ),
      body: const SettingsAccountForm(),
      drawer: const AppDrawer(),
    );
  }
}
