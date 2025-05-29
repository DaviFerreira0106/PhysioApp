import 'package:flutter/material.dart';
import 'package:physioapp/controller/auth_controller.dart';
import 'package:physioapp/utils/app_routes.dart';
import 'package:provider/provider.dart';
import 'package:physioapp/controller/user_fisio_controller.dart';

class SettingsAccountForm extends StatefulWidget {
  const SettingsAccountForm({super.key});

  @override
  SettingsAccountFormState createState() {
    return SettingsAccountFormState();
  }
}

class SettingsAccountFormState extends State<SettingsAccountForm> {
  final _formData = Map<String, Object>();
  final _formKey = GlobalKey<FormState>();
  bool _isLoadingUpdate = false;
  bool _isLoadingDelete = false;

  void _showUpdateDialog({required String msg}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Atualização de Conta'),
        content: Text(msg),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog({required String msg}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Exclusão de Conta'),
        content: Text(msg),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Não'),
          ),
          TextButton(
            onPressed: () async {
              await Provider.of<UserFisioController>(context, listen: false)
                  .deleteAccount();
              await Provider.of<AuthController>(context, listen: false)
                  .deleteAccount();
              Navigator.of(context)
                  .pushReplacementNamed(AppRoutes.authOrHomePage);
            },
            child: const Text('Sim'),
          ),
        ],
      ),
    );
  }

  Future<void> submitUpdate() async {
    final bool isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) return;

    _formKey.currentState?.save();

    setState(() => _isLoadingUpdate = true);

    final user = Provider.of<UserFisioController>(context, listen: false);

    await user.updateFisioUser(formData: _formData);

    _showUpdateDialog(msg: 'Dados da conta atualizados com sucesso!');

    setState(() => _isLoadingUpdate = false);
  }

  Future<void> submitDelete() async {
    setState(() => _isLoadingDelete = true);

    _showDeleteDialog(
      msg:
          'Tem Certeza que deseja excluir sua conta? Essa ação não poderá ser desfeita!',
    );

    setState(() => _isLoadingDelete = false);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final user = Provider.of<UserFisioController>(context, listen: false);
    return SizedBox(
      width: mediaQuery.width,
      child: Container(
        padding: const EdgeInsets.all(20),
        width: mediaQuery.width * 0.9,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 30),
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Column(
                    children: [
                      const CircleAvatar(
                        minRadius: 50,
                        child: Center(
                          child: Icon(Icons.person, size: 50),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Atualizar Foto'),
                      ),
                    ],
                  ),
                ),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Número Crefito'),
                ),
                initialValue: user.fisioUser.numberCrefito,
                keyboardType: TextInputType.text,
                onSaved: (numberCrefito) =>
                    _formData['numberCrefito'] = numberCrefito ?? '',
                validator: (numCrefitoValue) {
                  final String numCrefito = numCrefitoValue ?? "";

                  if (numCrefito.trim().isEmpty) {
                    return "Preenchimento obrigatório!";
                  }

                  if (numCrefito.trim().length != 8) {
                    return "Quantidade de caracteres invalidas";
                  }

                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Nome'),
                ),
                initialValue: user.fisioUser.name,
                keyboardType: TextInputType.name,
                onSaved: (name) => _formData['name'] = name ?? '',
                validator: (nameValue) {
                  final String name = nameValue ?? "";

                  if (name.trim().isEmpty) {
                    return "Preenchimento obrigatório!";
                  }

                  if (name.trim().length < 4) {
                    return "O nome precisa ter no minímo 4 caracteres";
                  }

                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('E-mail'),
                ),
                initialValue: user.fisioUser.email,
                keyboardType: TextInputType.emailAddress,
                onSaved: (email) => _formData['email'] = email ?? '',
                validator: (emailValue) {
                  final String email = emailValue ?? "";

                  if (email.trim().isEmpty) {
                    return "Preenchimento obrigatório!";
                  }

                  if (!email.trim().contains("@") || email.trim().length < 11) {
                    return "Digite um e-mail válido";
                  }

                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Telefone'),
                ),
                initialValue: user.fisioUser.numberTelephone,
                keyboardType: TextInputType.phone,
                onSaved: (phone) => _formData['phone'] = phone ?? '',
                validator: (phoneValue) {
                  final String phone = phoneValue ?? "";

                  if (phone.trim().isEmpty) {
                    return "Preenchimento obrigatório!";
                  }

                  if (phone.trim().length != 11) {
                    return "Número inválido. Não utilize caracteres como: (),.-+ \nCertifique-se de não conter espaços no campo!";
                  }

                  return null;
                },
              ),
              const SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _isLoadingUpdate
                      ? const CircularProgressIndicator()
                      : TextButton(
                          style: ButtonStyle(
                            backgroundColor: const WidgetStatePropertyAll(
                              Color.fromARGB(255, 0, 111, 202),
                            ),
                            minimumSize: WidgetStatePropertyAll(
                              Size(mediaQuery.width * 0.4, 50),
                            ),
                          ),
                          onPressed: () => submitUpdate(),
                          child: const Text(
                            'Atualizar',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                  _isLoadingDelete
                      ? const CircularProgressIndicator()
                      : TextButton(
                          style: ButtonStyle(
                            backgroundColor: const WidgetStatePropertyAll(
                              Colors.red,
                            ),
                            minimumSize: WidgetStatePropertyAll(
                              Size(mediaQuery.width * 0.4, 50),
                            ),
                          ),
                          onPressed: () => submitDelete(),
                          child: const Text(
                            'Excluir',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
