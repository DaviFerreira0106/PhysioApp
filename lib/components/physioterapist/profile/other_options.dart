import 'package:flutter/material.dart';
import 'package:physioapp/utils/app_routes.dart';

class OtherOptions extends StatefulWidget {
  const OtherOptions({super.key});

  @override
  State<OtherOptions> createState() => _OtherOptionsState();
}

class _OtherOptionsState extends State<OtherOptions> {
  Widget _defaultTextForm({required Widget textForm}) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: textForm,
    );
  }

  void _showChagePassword(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 400,
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 2,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Alterar senha',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text('Mantenha sua senha segura e atualizada'),
                  ],
                ),
              ),
              _defaultTextForm(
                textForm: TextField(
                  decoration: InputDecoration(
                    label: Text('Nova senha'),
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              _defaultTextForm(
                textForm: TextField(
                  decoration: InputDecoration(
                    label: Text('Confirmar senha'),
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Theme.of(context).colorScheme.tertiary,
                    ),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Concluir',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget componentListTile({
      required IconData icon,
      required String text,
      required Function() function,
      Color? color,
    }) {
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

    Future<void> showDeleteAccount() async {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog.adaptive(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 5,
              children: [
                Icon(
                  Icons.warning_rounded,
                  color: Theme.of(context).colorScheme.error,
                ),
                Text(
                  'Excluir Conta',
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ],
            ),
            content: const Text(
              'Esta é uma ação que não poderá ser desfeita, você tem certeza que deseja excluir de forma permanente sua conta?',
            ),
            actions: [
              TextButton(
                onPressed: () {},
                child: Text('Não'),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Sim'),
              ),
            ],
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
          function: () => _showChagePassword(context),
        ),
        componentListTile(
          icon: Icons.delete,
          text: 'Excluir Conta',
          function: () => showDeleteAccount(),
          color: const Color.fromARGB(255, 255, 0, 16),
        ),
      ],
    );
  }
}
