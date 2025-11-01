import 'package:flutter/material.dart';
import 'package:physioapp/utils/app_routes.dart';

class OtherOptions extends StatelessWidget {
  const OtherOptions({super.key});

  @override
  Widget build(BuildContext context) {
    Widget componentListTile(
        {required IconData icon,
        required String text,
        required String route,
        Color? color}) {
      return ListTile(
        leading: Icon(
          icon,
          color: color ?? Theme.of(context).textTheme.labelLarge?.color,
        ),
        title: Text(
          text,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: color ?? Theme.of(context).textTheme.labelLarge?.color),
        ),
        trailing: IconButton(
          onPressed: () => Navigator.of(context).pushNamed(route),
          icon: Icon(
            Icons.arrow_forward_ios_rounded,
            color: color ?? Theme.of(context).textTheme.labelLarge?.color,
          ),
        ),
      );
    }

    return Column(
      children: [
        componentListTile(
          icon: Icons.privacy_tip_rounded,
          text: 'Política de Privacidade',
          route: AppRoutes.policyPrivacyPage,
        ),
        componentListTile(
          icon: Icons.lock,
          text: 'Mudar Senha',
          route: '',
        ),
        componentListTile(
          icon: Icons.delete,
          text: 'Excluir Conta',
          route: '',
          color: const Color.fromARGB(255, 255, 0, 16),
        ),
      ],
    );
  }
}
