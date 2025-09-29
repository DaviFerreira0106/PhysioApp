import 'dart:io';

import 'package:flutter/material.dart';
import 'package:physioapp/model/auth/physio/auth.dart';
import 'package:physioapp/model/auth/physio/auth_form.dart';
import 'package:physioapp/utils/app_routes.dart';

class SecondFormSignUp extends StatefulWidget {
  const SecondFormSignUp({super.key});

  @override
  SecondFormSignUpState createState() => SecondFormSignUpState();
}

class SecondFormSignUpState extends State<SecondFormSignUp> {
  final AuthForm _authForm = AuthForm();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _vibilityPassword = false;
  bool _visibilityConfirmPassword = false;
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _submit() async {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (isValid != true) return;
    if(!mounted) return;
    print('chegou');
    print(_authForm.email);
    await Auth().signUp(
      crefito: '1234',
      clinic: RadioOption.clinic01,
      physioType: RadioButton.physioOption,
      imageProfile: File('/Users/daviferreira/Library/Developer/CoreSimulator/Devices/CF2B0CD7-8F9F-4423-BCD8-58DED4EE0F54/data/Containers/Data/Application/96C39E73-33E2-4DDA-8664-C2ED152D6687/tmp/image_picker_8F6F81B0-ABF0-4619-980C-0D3EA7E8BFDF-71021-0000094E1F1FAF08.jpg'),
      name: 'teste',
      email: 'teste@teste',
      password: 'teste123',
    );
    print('chegou2');
    Navigator.of(context).pushNamed(AppRoutes.homePagePhysio);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 20),
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                  color: const Color.fromARGB(255, 110, 125, 162), width: 1),
            ),
            child: TextFormField(
              onSaved: (name) => _authForm.name = name,
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
              validator: (_name) {
                String name = _name ?? '';

                if (name.isEmpty || name.length < 5) {
                  return 'Digite seu nome completo';
                }
              },
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 20),
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                  color: const Color.fromARGB(255, 110, 125, 162), width: 1),
            ),
            child: TextFormField(
              onSaved: (email) => _authForm.email = email,
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
              validator: (_email) {
                String email = _email ?? '';

                if (email.isEmpty || !email.contains('@')) {
                  return 'Digite um email valído';
                }
              },
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 20),
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                  color: const Color.fromARGB(255, 110, 125, 162), width: 1),
            ),
            child: TextFormField(
              onSaved: (password) => _authForm.password = password,
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
              validator: (_password) {
                String password = _password ?? '';

                if (password.isEmpty || password.length < 5) {
                  return 'Degite uma senha valída';
                }
              },
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 20),
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                  color: const Color.fromARGB(255, 110, 125, 162), width: 1),
            ),
            child: TextFormField(
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
              validator: (_confirmPassword) {
                String confirmPassword = _confirmPassword ?? '';

                if (confirmPassword != _passwordController.text) {
                  print(_authForm.password);
                  return 'Senhas divergente!';
                }
              },
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
