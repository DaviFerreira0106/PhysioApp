import 'package:flutter/material.dart';
import 'package:physioapp/utils/app_routes.dart';

class OtherOptions extends StatelessWidget {
  const OtherOptions({super.key});

  @override
  Widget build(BuildContext context) {
    Widget componentListTile(
        {required IconData icon,
        required String text,
        required void Function() function,
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
          onPressed: () => function(),
          icon: Icon(
            Icons.arrow_forward_ios_rounded,
            color: color ?? Theme.of(context).textTheme.labelLarge?.color,
          ),
        ),
      );
    }

    Future<void> showChagePassword() async {
      showBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  label: Text('Nova senha'),
                ),
              )
            ],
          );
        },
      );
    }

    Future<void> showDeleteAccount() async {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog.adaptive(
            title: Text('Excluir Conta'),
          );
        },
      );
    }

    return Column(
      children: [
        componentListTile(
          icon: Icons.privacy_tip_rounded,
          text: 'Política de Privacidade',
          function: () =>
              Navigator.of(context).pushNamed(AppRoutes.policyPrivacyPage),
        ),
        componentListTile(
          icon: Icons.lock,
          text: 'Mudar Senha',
          function: () => showChagePassword,
        ),
        componentListTile(
          icon: Icons.delete,
          text: 'Excluir Conta',
          function: () => showDeleteAccount,
          color: const Color.fromARGB(255, 255, 0, 16),
        ),
      ],
    );
  }
}
