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
  final _formKey = GlobalKey<FormState>();

  var _formData = Map<String, Object>();

  @override
  void dispose() {
    super.dispose();
    _nameFocus.dispose();
    _emailFocus.dispose();
    _phoneFocus.dispose();
    _passwordFocus.dispose();
    _confirmPassword.dispose();
  }

  void submit() {
    _formKey.currentState?.validate();
    _formKey.currentState?.save();
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
            key: _formKey,
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
                    initialValue: _formData['numberCrefito']?.toString(),
                    decoration: InputDecoration(labelText: "Número Crefito"),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    onSaved: (numberCrefito) =>
                        _formData["numberCrefito"] = numberCrefito ?? "",
                    onFieldSubmitted: (_) =>
                        FocusScope.of(context).requestFocus(_nameFocus),
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
                if (_auth_mode == AuthMode.signup)
                  TextFormField(
                    initialValue: _formData["name"]?.toString(),
                    decoration: InputDecoration(labelText: "Nome Completo"),
                    keyboardType: TextInputType.name,
                    focusNode: _nameFocus,
                    textInputAction: TextInputAction.next,
                    onSaved: (name) => _formData["name"] = name ?? "",
                    onFieldSubmitted: (_) =>
                        FocusScope.of(context).requestFocus(_phoneFocus),
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
                if (_auth_mode == AuthMode.signup)
                  TextFormField(
                      initialValue: _formData["phone"]?.toString(),
                      decoration: InputDecoration(
                          labelText: "Número de Telefone",
                          hintText: "11999993333"),
                      keyboardType: TextInputType.phone,
                      focusNode: _phoneFocus,
                      textInputAction: TextInputAction.next,
                      onSaved: (phone) => _formData["phone"] = phone ?? "",
                      onFieldSubmitted: (_) =>
                          FocusScope.of(context).requestFocus(_emailFocus),
                      validator: (phoneValue) {
                        final String phone = phoneValue ?? "";

                        if (phone.trim().isEmpty) {
                          return "Preenchimento obrigatório!";
                        }

                        if (phone.trim().length != 11) {
                          return "Número inválido. Não utilize caracteres como: (),.-+ \nCertifique-se de não conter espaços no campo!";
                        }

                        return null;
                      }),
                TextFormField(
                    initialValue: _formData["email"]?.toString(),
                    decoration: InputDecoration(labelText: "E-mail"),
                    keyboardType: TextInputType.emailAddress,
                    focusNode: _emailFocus,
                    textInputAction: TextInputAction.next,
                    onSaved: (email) => _formData["email"] = email ?? "",
                    onFieldSubmitted: (_) =>
                        FocusScope.of(context).requestFocus(_passwordFocus),
                    validator: (emailValue) {
                      final String email = emailValue ?? "";

                      if (email.trim().isEmpty) {
                        return "Preenchimento obrigatório!";
                      }

                      if (!email.trim().contains("@") ||
                          email.trim().length < 10) {
                        return "Digite um e-mail válido";
                      }

                      return null;
                    }),
                TextFormField(
                  initialValue: _formData["password"]?.toString(),
                  decoration: InputDecoration(labelText: "Senha"),
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  focusNode: _passwordFocus,
                  textInputAction: TextInputAction.done,
                  onSaved: (password) => _formData["password"] = password ?? "",
                  validator: (passwordValue) {
                    final String password = passwordValue ?? "";

                    if (password.trim().isEmpty) {
                      return "Preenchimento obrigatório!";
                    }

                    if (password.trim().length < 8) {
                      return "A senha precisa ter no minimo 8 caracteres!";
                    }

                    return null;
                  },
                ),
                if (_auth_mode == AuthMode.signup)
                  TextFormField(
                    initialValue: _formData["confirmPassword"]?.toString(),
                    decoration: InputDecoration(labelText: "Confirmar Senha"),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    validator: (confirmPasswordValue) {
                      final String conPassword = confirmPasswordValue ?? "";

                      if (conPassword.trim().isEmpty) {
                        return "Preenchimento obrigatório!";
                      }

                      if (conPassword.trim() != _formData['password']) {
                        return "As senhas estão diferentes";
                      }

                      return null;
                    },
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
            onPressed: () => submit(),
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
                _formData = {};
              });
            },
            child: Text(
              _auth_mode == AuthMode.signup ? "Entrar" : "Cadastrar-se",
            ),
          ),
          if (_auth_mode == AuthMode.login)
            TextButton(
              onPressed: () {},
              child: const Text("Esqueci minha senha"),
            ),
        ],
      ),
    );
  }
}
