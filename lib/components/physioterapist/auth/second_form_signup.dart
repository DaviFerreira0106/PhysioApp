import 'dart:io';

import 'package:flutter/material.dart';
import 'package:physioapp/components/form_components.dart';
import 'package:physioapp/model/auth/physio/auth.dart';
import 'package:physioapp/model/auth/physio/auth_form.dart';
import 'package:physioapp/utils/app_routes.dart';

class SecondFormSignUp extends StatefulWidget {
  const SecondFormSignUp({super.key});

  @override
  SecondFormSignUpState createState() => SecondFormSignUpState();
}

class SecondFormSignUpState extends State<SecondFormSignUp> {
  // Atributos de controle
  final AuthForm _authForm = AuthForm();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _vibilityPassword = false;
  bool _visibilityConfirmPassword = false;
  final TextEditingController _passwordController = TextEditingController();

  void _showErrorValidate({required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
    );
  }

  // Metodo para submissão de formulário
  Future<void> _submit() async {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (isValid == false) return;

    // Validação de campos
    if (_authForm.name == null ||
        _authForm.name!.isEmpty ||
        _authForm.name!.length < 5) {
      return _showErrorValidate(message: 'Digite seu nome completo!');
    }
    if (_authForm.email == null ||
        _authForm.email!.isEmpty ||
        !_authForm.email!.contains('@')) {
      return _showErrorValidate(message: 'Digite um e-mail valído!');
    }
    if (_authForm.password == null ||
        _authForm.password!.isEmpty ||
        _authForm.password!.length < 6) {
      return _showErrorValidate(
          message: 'Digite uma senha com pelo menos 6 caracteres!');
    }
    if (_passwordController.text != _authForm.password) {
      return _showErrorValidate(
          message: 'As senhas digitadas estão divergentes!');
    }

    try {
      await Auth().signUp(
        physioType: _authForm.currentRadioValue,
        imageProfile: File(
            '/Users/daviferreira/Library/Developer/CoreSimulator/Devices/CF2B0CD7-8F9F-4423-BCD8-58DED4EE0F54/data/Containers/Data/Application/96C39E73-33E2-4DDA-8664-C2ED152D6687/tmp/image_picker_8F6F81B0-ABF0-4619-980C-0D3EA7E8BFDF-71021-0000094E1F1FAF08.jpg'),
        name: _authForm.name!,
        email: _authForm.email!,
        password: _authForm.password!,
      );

      if (mounted) {
        Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.homePagePhysio, (_) => false,);
      }
    } catch (e) {
      _showErrorValidate(
        message: e.toString(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          FormComponents(
            textForm: TextFormField(
              onChanged: (name) => _authForm.name = name,
              decoration: InputDecoration(
                label: Text(
                  'Nome Completo',
                  style: TextStyle(
                    fontFamily:
                        Theme.of(context).textTheme.bodyMedium?.fontFamily,
                    color: Theme.of(context).textTheme.labelMedium?.color,
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.name,
            ),
          ),
          FormComponents(
            textForm: TextFormField(
              onChanged: (email) => _authForm.email = email,
              decoration: InputDecoration(
                label: Text(
                  'Email',
                  style: TextStyle(
                    fontFamily:
                        Theme.of(context).textTheme.bodyMedium?.fontFamily,
                    color: Theme.of(context).textTheme.labelMedium?.color,
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          FormComponents(
            textForm: TextFormField(
              onChanged: (password) => _authForm.password = password,
              controller: _passwordController,
              decoration: InputDecoration(
                label: Text(
                  'Senha',
                  style: TextStyle(
                    fontFamily:
                        Theme.of(context).textTheme.bodyMedium?.fontFamily,
                    color: Theme.of(context).textTheme.labelMedium?.color,
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                border: InputBorder.none,
                suffixIcon: _vibilityPassword == true
                    ? GestureDetector(
                        onTap: () {
                          setState(
                              () => _vibilityPassword = !_vibilityPassword);
                        },
                        child: Icon(
                          Icons.visibility_outlined,
                          color: Theme.of(context).textTheme.labelLarge?.color,
                          size: 22,
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          setState(
                              () => _vibilityPassword = !_vibilityPassword);
                        },
                        child: Icon(
                          Icons.visibility_off_outlined,
                          color: Theme.of(context).textTheme.labelLarge?.color,
                          size: 22,
                        ),
                      ),
              ),
              keyboardType: TextInputType.visiblePassword,
              obscureText: _vibilityPassword == true ? false : true,
            ),
          ),
          FormComponents(
            textForm: TextFormField(
              decoration: InputDecoration(
                label: Text(
                  'Confirmar Senha',
                  style: TextStyle(
                    fontFamily:
                        Theme.of(context).textTheme.bodyMedium?.fontFamily,
                    color: Theme.of(context).textTheme.labelMedium?.color,
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                border: InputBorder.none,
                suffixIcon: _visibilityConfirmPassword == true
                    ? GestureDetector(
                        onTap: () {
                          setState(() => _visibilityConfirmPassword =
                              !_visibilityConfirmPassword);
                        },
                        child: Icon(
                          Icons.visibility_outlined,
                          color: Theme.of(context).textTheme.labelLarge?.color,
                          size: 22,
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          setState(() => _visibilityConfirmPassword =
                              !_visibilityConfirmPassword);
                        },
                        child: Icon(
                          Icons.visibility_off_outlined,
                          color: Theme.of(context).textTheme.labelLarge?.color,
                          size: 22,
                        ),
                      ),
              ),
              keyboardType: TextInputType.visiblePassword,
              obscureText: _visibilityConfirmPassword == true ? false : true,
            ),
          ),
          Container(
            width: double.infinity,
            height: 60,
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  Theme.of(context).colorScheme.primary,
                ),
              ),
              onPressed: () {
                _submit();
              },
              child: Text(
                'Cadastrar',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily:
                      Theme.of(context).textTheme.titleLarge?.fontFamily,
                  fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
