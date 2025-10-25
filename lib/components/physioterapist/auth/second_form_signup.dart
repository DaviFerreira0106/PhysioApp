import 'package:flutter/material.dart';
import 'package:physioapp/components/form_components.dart';
import 'package:physioapp/services/auth/physio/auth_form.dart';
import 'package:physioapp/exception/auth_signup_exception.dart';
import 'package:physioapp/utils/signup_page_form.dart';
import 'package:provider/provider.dart';

class SecondFormSignUp extends StatefulWidget {
  final void Function(AuthFormData) onSubmited;
  const SecondFormSignUp({super.key, required this.onSubmited});

  @override
  SecondFormSignUpState createState() => SecondFormSignUpState();
}

class SecondFormSignUpState extends State<SecondFormSignUp> {
  // Atributos de controle
  final AuthSignupException _authException = AuthSignupException();
  final AuthFormData _authForm = AuthFormData();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _vibilityPassword = false;
  bool _visibilityConfirmPassword = false;

  // Metodo para submissão de formulário
  Future<void> _submit() async {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (isValid == false) return;

    // Validação de campos
    if (_authException.validateName(name: _authForm.name, context: context)) {
      return _authException.showErrorValidate(
        message: 'Digite seu nome completo!',
        context: context,
      );
    }

    if (_authException.validateEmail(
        email: _authForm.email, context: context)) {
      return _authException.showErrorValidate(
        message: 'Digite um e-mail valído!',
        context: context,
      );
    }
    if (_authException.validatePassword(
      password: _authForm.password,
      context: context,
    )) {
      return _authException.showErrorValidate(
        message: 'Digite uma senha com pelo menos 6 caracteres!',
        context: context,
      );
    }
    if (_authException.confirmPasswordValid(
      confirmPassword: _confirmPasswordController.text,
      password: _authForm.password,
      context: context,
    )) {
      return _authException.showErrorValidate(
        message: 'As senhas digitadas estão divergentes!',
        context: context,
      );
    }

    widget.onSubmited(_authForm);
  }

  @override
  Widget build(BuildContext context) {
    final pageForm = Provider.of<SignUpPageForm>(context, listen: false);
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
              controller: _confirmPasswordController,
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
            margin: const EdgeInsets.only(bottom: 10, top: 10),
            child: pageForm.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ElevatedButton(
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
                        fontSize:
                            Theme.of(context).textTheme.titleLarge?.fontSize,
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
