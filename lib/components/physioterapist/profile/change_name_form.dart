import 'package:flutter/material.dart';
import 'package:physioapp/exception/auth_signup_exception.dart';
import 'package:physioapp/services/auth/physio/auth_physio_service.dart';

class ChangeNameForm extends StatefulWidget {
  const ChangeNameForm({super.key});

  @override
  State<ChangeNameForm> createState() => _ChangeNameFormState();
}

class _ChangeNameFormState extends State<ChangeNameForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  Widget _defaultTextForm({required Widget textForm}) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: textForm,
    );
  }

  void _showMessageDialog({required String title, required String message}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog.adaptive(
        icon: Icon(Icons.check_circle_rounded),
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }

  Future<void> _submit() async {
    final currentUser = AuthPhysioService();

    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) return;

    try {
      await currentUser.updateUser(currentUser: currentUser.currentPhysioUser);

      return _showMessageDialog(
          title: 'Sucesso', message: 'Atualização feita com sucesso!');
    } catch (error) {
      return _showMessageDialog(title: 'Erro', message: 'Ação não realizada');
    } finally {
      if (mounted) {
        Navigator.of(context).pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Alterar Nome',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text('Alterar nome cadastrado'),
                ],
              ),
            ),
            _defaultTextForm(
              textForm: TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  label: Text('Nome'),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                ),
                keyboardType: TextInputType.name,
                validator: (_name) {
                  String name = _name ?? '';

                  if (name.trim().length < 6) {
                    return 'Digite seu nome completo';
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 15),
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
                onPressed: () => _submit(),
                child: const Text(
                  'Atualizar',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
