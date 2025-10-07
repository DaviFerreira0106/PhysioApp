import 'package:flutter/material.dart';

enum RadioButton {
  physioOption,
  therapyOption,
}

class FormSignIn extends StatefulWidget {
  const FormSignIn({super.key});

  @override
  FormSignInState createState() => FormSignInState();
}

class FormSignInState extends State<FormSignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _vibilityPassword = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  RadioButton _radioPhysioValue = RadioButton.physioOption;
  bool _physioOptionSelect() => _radioPhysioValue == RadioButton.physioOption;

  void _onChangedRadioValue({required RadioButton? value}) {
    setState(() {
      _radioPhysioValue = value ?? RadioButton.physioOption;
    });
  }

  Future<void> _submit() async {
    final isValid = _formKey.currentState?.validate() ?? false;

    
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
              controller: _emailController,
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
              controller: _passwordController,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                fit: FlexFit.loose,
                flex: 1,
                child: RadioListTile<RadioButton>(
                  value: RadioButton.physioOption,
                  groupValue: _radioPhysioValue,
                  title: Text(
                    'Fisioterapia',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily:
                          Theme.of(context).textTheme.bodyMedium?.fontFamily,
                      color: _physioOptionSelect()
                          ? Colors.white
                          : Theme.of(context).textTheme.labelLarge?.color,
                    ),
                  ),
                  onChanged: (value) {
                    _onChangedRadioValue(value: value);
                  },
                  fillColor: WidgetStatePropertyAll(
                    !_physioOptionSelect()
                        ? Theme.of(context).textTheme.labelLarge?.color
                        : Theme.of(context).colorScheme.primary,
                  ),
                  selected: _physioOptionSelect(),
                ),
              ),
              Flexible(
                fit: FlexFit.loose,
                flex: 1,
                child: RadioListTile<RadioButton>(
                  value: RadioButton.therapyOption,
                  groupValue: _radioPhysioValue,
                  title: Text(
                    'Terapia\nOcupacional',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily:
                          Theme.of(context).textTheme.bodyMedium?.fontFamily,
                      color: !_physioOptionSelect()
                          ? Colors.white
                          : Theme.of(context).textTheme.labelLarge?.color,
                    ),
                  ),
                  onChanged: (value) {
                    _onChangedRadioValue(value: value);
                  },
                  fillColor: WidgetStatePropertyAll(
                    _physioOptionSelect()
                        ? Theme.of(context).textTheme.labelLarge?.color
                        : Theme.of(context).colorScheme.primary,
                  ),
                  selected: !_physioOptionSelect(),
                ),
              ),
            ],
          ),
          Container(
            height: 60,
            width: double.infinity,
            margin: const EdgeInsets.only(top: 20),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  Theme.of(context).colorScheme.primary,
                ),
              ),
              onPressed: () {},
              child: Text(
                'Entrar',
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
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Esqueci minha senha',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiary,
                  fontFamily:
                      Theme.of(context).textTheme.labelLarge?.fontFamily,
                  fontSize: Theme.of(context).textTheme.labelLarge?.fontSize,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline,
                  decorationColor: Theme.of(context).colorScheme.tertiary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
