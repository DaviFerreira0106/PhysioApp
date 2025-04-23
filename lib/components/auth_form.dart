import 'package:flutter/material.dart';

enum AuthMode {
  login,
  signup,
}

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  AuthFormState createState() {
    return AuthFormState();
  }
}

class AuthFormState extends State<AuthForm> {
  final AuthMode _auth_mode = AuthMode.login;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          Form(
            child: Column(
              children: [
                _auth_mode == AuthMode.login
                    ? Container()
                    : SizedBox(
                        child: Column(
                          children: [
                            const CircleAvatar(
                              radius: 50,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text("Selecionar Foto"),
                            ),
                          ],
                        ),
                      ),
                if (_auth_mode == AuthMode.signup)
                  TextFormField(
                    decoration: InputDecoration(labelText: "Número Crefito"),
                  ),
                if (_auth_mode == AuthMode.signup)
                  TextFormField(
                    decoration: InputDecoration(labelText: "Nome Completo"),
                  ),
                TextFormField(
                  decoration: InputDecoration(labelText: "E-mail"),
                ),
                if (_auth_mode == AuthMode.signup)
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: "Número de Telefone"),
                  ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Senha"),
                ),
                if (_auth_mode == AuthMode.signup)
                  TextFormField(
                    decoration: InputDecoration(labelText: "Confirmar Senha"),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          TextButton(
            style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  Color.fromARGB(255, 0, 111, 202),
                ),
                minimumSize: WidgetStatePropertyAll(Size(300, 50))),
            onPressed: () {},
            child: Text(
              _auth_mode == AuthMode.signup ? "Cadastrar" : "Entrar",
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {},
            child: Text(
              _auth_mode == AuthMode.signup ? "Entrar" : "Cadastrar-se",
            ),
          ),
        ],
      ),
    );
  }
}
