import 'package:flutter/material.dart';
import 'package:physioapp/services/auth/patient/auth_patient_service.dart';
import 'package:physioapp/services/auth/physio/auth_physio_service.dart';

class ChangePasswordForm extends StatefulWidget {
  const ChangePasswordForm({super.key});

  @override
  State<ChangePasswordForm> createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  bool _vibilityPassword = false;
  bool _visibilityConfirmPassword = false;

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

  void _showDialog({required String title, required String content}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog.adaptive(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
              onPressed: () => Navigator.of(context).pop(), child: Text('Ok'))
        ],
      ),
    );
  }

  Future<void> _submit() async {
    final isValid = _formKey.currentState?.validate() ?? false;
    final currentUser = AuthPatientService();

    if (!isValid) {
      return;
    }

    try {
      await currentUser.updateUser(password: _passwordController.text);

      _showDialog(
          title: 'Sucesso', content: 'Alteração realizada com sucesso!');

      Navigator.of(context).pop();
    } catch (error) {
      _showDialog(
          title: 'Erro',
          content: 'Alteração não realizada! ${error.toString()}');
    }
  }
//"$2a$10$VXMX5gAWlB0lmfE6jJ4GQOKjQ7CGZr4nRirhUeBBb/YNsvaoKw/O6"

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Form(
        key: _formKey,
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
              textForm: TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  label: Text('Nova senha'),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() => _vibilityPassword = !_vibilityPassword);
                    },
                    child: Icon(
                      _vibilityPassword == true
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: Theme.of(context).textTheme.labelLarge?.color,
                      size: 22,
                    ),
                  ),
                ),
                obscureText: _vibilityPassword == true ? false : true,
                keyboardType: TextInputType.visiblePassword,
                validator: (_password) {
                  String password = _password ?? '';

                  if (password.trim().length < 6) {
                    return 'Sua senha precisa ter no mínimo 6 caracteres';
                  }
                },
              ),
            ),
            _defaultTextForm(
              textForm: TextFormField(
                decoration: InputDecoration(
                  label: Text('Confirmar senha'),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(
                        () => _visibilityConfirmPassword =
                            !_visibilityConfirmPassword,
                      );
                    },
                    child: Icon(
                      _visibilityConfirmPassword == true
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: Theme.of(context).textTheme.labelLarge?.color,
                      size: 22,
                    ),
                  ),
                ),
                obscureText: _visibilityConfirmPassword == true ? false : true,
                keyboardType: TextInputType.visiblePassword,
                validator: (_confirmPassword) {
                  String confirmPassword = _confirmPassword ?? '';

                  if (confirmPassword != _passwordController.text) {
                    return 'As senhas estão divergente!';
                  }
                },
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
                onPressed: () => _submit(),
                child: const Text(
                  'Concluir',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
