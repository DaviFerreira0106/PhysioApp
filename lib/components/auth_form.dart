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
  AuthMode _auth_mode = AuthMode.login;
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPassword = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _nameFocus.dispose();
    _emailFocus.dispose();
    _phoneFocus.dispose();
    _passwordFocus.dispose();
    _confirmPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
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
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) =>
                        FocusScope.of(context).requestFocus(_nameFocus),
                  ),
                if (_auth_mode == AuthMode.signup)
                  TextFormField(
                    decoration: InputDecoration(labelText: "Nome Completo"),
                    keyboardType: TextInputType.name,
                    focusNode: _nameFocus,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) =>
                        FocusScope.of(context).requestFocus(_phoneFocus),
                  ),
                if (_auth_mode == AuthMode.signup)
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: "Número de Telefone"),
                    keyboardType: TextInputType.phone,
                    focusNode: _phoneFocus,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) =>
                        FocusScope.of(context).requestFocus(_emailFocus),
                  ),
                TextFormField(
                  decoration: InputDecoration(labelText: "E-mail"),
                  keyboardType: TextInputType.emailAddress,
                  focusNode: _emailFocus,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) =>
                      FocusScope.of(context).requestFocus(_passwordFocus),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Senha"),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  focusNode: _passwordFocus,
                  textInputAction: TextInputAction.done,
                ),
                if (_auth_mode == AuthMode.signup)
                  TextFormField(
                    decoration: InputDecoration(labelText: "Confirmar Senha"),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
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
            onPressed: () {
              setState(() {
                _auth_mode == AuthMode.login
                    ? _auth_mode = AuthMode.signup
                    : _auth_mode = AuthMode.login;
              });
            },
            child: Text(
              _auth_mode == AuthMode.signup ? "Entrar" : "Cadastrar-se",
            ),
          ),
        ],
      ),
    );
  }
}
