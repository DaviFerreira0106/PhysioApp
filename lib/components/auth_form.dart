import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:physioapp/controller/auth_controller.dart';
import 'package:physioapp/exceptions/reset_password_exception.dart';
import 'package:provider/provider.dart';
import 'package:physioapp/exceptions/auth_exception.dart';

enum AuthMode {
  login,
  signup,
  resetPassword,
}

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  AuthFormState createState() {
    return AuthFormState();
  }
}

class AuthFormState extends State<AuthForm> {
  AuthMode _authMode = AuthMode.login;
  final FocusNode _nameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPassword = FocusNode();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  final _formData = Map<String, Object>();

  @override
  void dispose() {
    super.dispose();
    _nameFocus.dispose();
    _emailFocus.dispose();
    _phoneFocus.dispose();
    _passwordFocus.dispose();
    _confirmPassword.dispose();
  }

  void _showErrorDialog({required String msg}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Erro de Autenticação'),
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

  void _showErrorResetPasswordDialog({required String msg}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Erro de Verificação'),
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

  void _showResetDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Redefinição de senha'),
        content: const Text('Enviamos um link para seu e-mail'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }

  Future<void> resetPassword() async {
    final bool isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) return;

    _formKey.currentState?.save();

    setState(() => _isLoading = true);

    final auth = Provider.of<AuthController>(context, listen: false);

    try {
      await auth.resetPassword(email: _formData['email'] as String);
      _showResetDialog();
    } on ResetPasswordExceptions catch (error) {
      _showErrorResetPasswordDialog(msg: error.toString());
    } catch (error) {
      _showErrorResetPasswordDialog(
        msg: 'Ocorreu um erro na autneticação do usuário',
      );
    }

    setState(() => _isLoading = false);
  }

  Future<void> submit() async {
    final bool isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) return;

    _formKey.currentState?.save();

    setState(() => _isLoading = true);

    final auth = Provider.of<AuthController>(context, listen: false);

    try {
      if (_authMode == AuthMode.login) {
        // Login
        await auth.signin(formData: _formData);
      } else {
        // Cadastro
        await auth.signup(formData: _formData);
      }
    } on AuthExceptions catch (error) {
      _showErrorDialog(msg: error.toString());
    } catch (error) {
      print(error);
      _showErrorDialog(
        msg: 'Ocorreu um erro na autneticação do usuário',
      );
    }

    setState(() => _isLoading = false);
  }

  void _toggleForm() {
    setState(() {
      _authMode == AuthMode.login
          ? _authMode = AuthMode.signup
          : _authMode = AuthMode.login;
      _emailController.text = "";
      _confirmPasswordController.text = "";
    });
  }

  void _toggleFormResetPassword() {
    setState(() {
      _authMode == AuthMode.login
          ? _authMode = AuthMode.resetPassword
          : _authMode = AuthMode.login;
      _emailController.text = '';
    });
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
                _authMode == AuthMode.login ||
                        _authMode == AuthMode.resetPassword
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
                if (_authMode == AuthMode.signup)
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: "Número Crefito"),
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
                if (_authMode == AuthMode.signup)
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: "Nome Completo"),
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
                if (_authMode == AuthMode.signup)
                  TextFormField(
                      decoration: const InputDecoration(
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
                    decoration: const InputDecoration(labelText: "E-mail"),
                    keyboardType: TextInputType.emailAddress,
                    focusNode: _emailFocus,
                    textInputAction: TextInputAction.next,
                    onSaved: (email) => _formData["email"] = email ?? "",
                    controller: _emailController,
                    onFieldSubmitted: (_) =>
                        FocusScope.of(context).requestFocus(_passwordFocus),
                    validator: (emailValue) {
                      final String email = emailValue ?? "";

                      if (email.trim().isEmpty) {
                        return "Preenchimento obrigatório!";
                      }

                      if (!email.trim().contains("@") ||
                          email.trim().length < 11) {
                        return "Digite um e-mail válido";
                      }

                      return null;
                    }),
                if (_authMode == AuthMode.login || _authMode == AuthMode.signup)
                  TextFormField(
                    decoration: const InputDecoration(labelText: "Senha"),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    focusNode: _passwordFocus,
                    controller: _passwordController,
                    textInputAction: TextInputAction.done,
                    onSaved: (password) =>
                        _formData["password"] = password ?? "",
                    validator: (passwordValue) {
                      String password = passwordValue ?? "";
                      password = password.trim();

                      final upper_rule = RegExp(r'(?=.*[A-Z])');
                      final lower_rule = RegExp(r'(?=.*[a-z])');
                      final numeric_rule = RegExp(r'(?=.*[0-9])');
                      final specialCH_rule = RegExp(r'(?=.*[!@#\$&*~])');
                      final minCh_rule = RegExp(r'.{8,}');

                      if (password.isEmpty) {
                        return 'Senha é obrigatória';
                      } else if (!upper_rule.hasMatch(password)) {
                        return 'Senha precisa de pelo menos UMA letra maiúscula';
                      } else if (!lower_rule.hasMatch(password)) {
                        return 'Senha precisa de pelo menos UMA letra minúscula';
                      } else if (!numeric_rule.hasMatch(password)) {
                        return 'Senha precisa de pelo menos UM número';
                      } else if (!specialCH_rule.hasMatch(password)) {
                        return 'Senha precisa de pelo menos UM caractere especial';
                      } else if (!minCh_rule.hasMatch(password)) {
                        return 'Senha precisa de pelo menos 8 caracteres';
                      }

                      return null;
                    },
                  ),
                if (_authMode == AuthMode.signup)
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: "Confirmar Senha"),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    controller: _confirmPasswordController,
                    validator: (confirmPasswordValue) {
                      final String conPassword = confirmPasswordValue ?? "";

                      if (conPassword.trim().isEmpty) {
                        return "Preenchimento obrigatório!";
                      }

                      if (conPassword.trim() != _passwordController.text) {
                        return "As senhas estão diferentes";
                      }

                      return null;
                    },
                  ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          _isLoading
              ? const CircularProgressIndicator()
              : TextButton(
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Color.fromARGB(255, 0, 111, 202),
                      ),
                      minimumSize: WidgetStatePropertyAll(Size(300, 50))),
                  onPressed: () => _authMode == AuthMode.login ||
                          _authMode == AuthMode.signup
                      ? submit()
                      : resetPassword(),
                  child: _authMode == AuthMode.login ||
                          _authMode == AuthMode.signup
                      ? Text(
                          _authMode == AuthMode.signup ? "Cadastrar" : "Entrar",
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          "Enviar",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                ),
          const SizedBox(height: 20),
          if (_authMode == AuthMode.login || _authMode == AuthMode.signup)
            TextButton(
              onPressed: () => _toggleForm(),
              child: Text(
                _authMode == AuthMode.signup ? "Entrar" : "Cadastrar-se",
              ),
            ),
          if (_authMode == AuthMode.login ||
              _authMode == AuthMode.resetPassword)
            TextButton(
              onPressed: () => _toggleFormResetPassword(),
              child: Text(_authMode == AuthMode.login
                  ? "Esqueci minha senha"
                  : "Voltar para login"),
            ),
        ],
      ),
    );
  }
}
