import 'package:flutter/material.dart';
import 'package:physioapp/components/form_components.dart';
import 'package:physioapp/services/auth/auth_form.dart';
import 'package:physioapp/utils/signup_page_form.dart';
import 'package:provider/provider.dart';

class FirstFormSignUp extends StatefulWidget {
  const FirstFormSignUp({super.key});

  @override
  FisrtFormSignUpState createState() => FisrtFormSignUpState();
}

class FisrtFormSignUpState extends State<FirstFormSignUp> {
  // Variaveis de controle
  final _authForm = AuthFormData();
  final _signUpPage = SignUpPageForm();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Metodo de controle de página
  void _nextPageForm({required BuildContext context}) {
    final bool isValid = _formKey.currentState?.validate() ?? false;

    if (isValid == false) return;

    if (AuthFormData.crefito == null || AuthFormData.crefito!.length < 10) {
      return _showErrorValidate(message: 'Digite um número crefito valido');
    }

    Provider.of<SignUpPageForm>(context, listen: false)
        .toggleForm(value: _signUpPage.secondForm);
  }

  void _showErrorValidate({required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authFormProvider = Provider.of<AuthFormData>(context);
    return Form(
      key: _formKey,
      child: Column(
        children: [
          FormComponents(
            textForm: TextFormField(
              onChanged: (crefito) => AuthFormData.crefito = crefito,
              decoration: InputDecoration(
                label: Text(
                  'Número Crefito',
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
              keyboardType: TextInputType.text,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                fit: FlexFit.loose,
                flex: 1,
                child: RadioListTile<RadioButton>(
                  value: _authForm.physioValue,
                  groupValue: authFormProvider.currentRadioValue,
                  title: Text(
                    'Fisioterapia',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily:
                          Theme.of(context).textTheme.bodyMedium?.fontFamily,
                      color: authFormProvider.optionPhysioSelected
                          ? Colors.white
                          : Theme.of(context).textTheme.labelLarge?.color,
                    ),
                  ),
                  onChanged: (value) {
                    authFormProvider.onChangedRadioValue(value: value);
                    _authForm.currentRadioValue =
                        value ?? _authForm.physioValue;
                    _authForm.physioType = value;
                  },
                  fillColor: WidgetStatePropertyAll(
                    authFormProvider.optionPhysioSelected
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).textTheme.labelLarge?.color,
                  ),
                  selected: _authForm.optionPhysioSelected,
                ),
              ),
              Flexible(
                fit: FlexFit.loose,
                flex: 1,
                child: RadioListTile<RadioButton>(
                  value: _authForm.therapyValue,
                  groupValue: authFormProvider.currentRadioValue,
                  title: Text(
                    'Terapia\nOcupacional',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily:
                          Theme.of(context).textTheme.bodyMedium?.fontFamily,
                      color: authFormProvider.optionTherapySelected
                          ? Colors.white
                          : Theme.of(context).textTheme.labelLarge?.color,
                    ),
                  ),
                  onChanged: (value) {
                    authFormProvider.onChangedRadioValue(value: value);
                    _authForm.currentRadioValue =
                        value ?? _authForm.therapyValue;
                    _authForm.physioType = value;
                  },
                  fillColor: WidgetStatePropertyAll(
                    authFormProvider.optionTherapySelected
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).textTheme.labelLarge?.color,
                  ),
                  selected: _authForm.optionTherapySelected,
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: 60,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  Theme.of(context).colorScheme.primary,
                ),
              ),
              onPressed: () => _nextPageForm(context: context),
              label: Text(
                'Próximo',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily:
                      Theme.of(context).textTheme.titleLarge?.fontFamily,
                  fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                  fontWeight: FontWeight.w700,
                ),
              ),
              icon: const Icon(
                Icons.arrow_forward_rounded,
                color: Colors.white,
                size: 20,
              ),
              iconAlignment: IconAlignment.end,
            ),
          ),
        ],
      ),
    );
  }
}
