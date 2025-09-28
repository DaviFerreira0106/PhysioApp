import 'package:flutter/material.dart';
import 'package:physioapp/utils/signup_page_form.dart';
import 'package:provider/provider.dart';

enum RadioOption {
  clinic01,
  clinic02,
  clinic03,
}

enum RadioButton {
  physioOption,
  therapyOption,
}

class FirstFormSignUp extends StatefulWidget {
  const FirstFormSignUp({super.key});

  @override
  FisrtFormSignUpState createState() => FisrtFormSignUpState();
}

class FisrtFormSignUpState extends State<FirstFormSignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  RadioOption _radioOptionValue = RadioOption.clinic01;
  bool _openListOption = false;
  bool _firstClinicOption() => _radioOptionValue == RadioOption.clinic01;
  bool _secondClinicOption() => _radioOptionValue == RadioOption.clinic02;
  bool _thirdClinicOption() => _radioOptionValue == RadioOption.clinic03;

  RadioButton _radioPhysioValue = RadioButton.physioOption;
  bool _physioOptionSelect() => _radioPhysioValue == RadioButton.physioOption;

  void _onChangedRadioValue({required RadioButton? value}) {
    setState(() {
      _radioPhysioValue = value ?? RadioButton.physioOption;
    });
  }

  void _onChangedRadioOption({required RadioOption? value}) {
    setState(
      () => _radioOptionValue = value ?? RadioOption.clinic01,
    );
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
          Container(
            height: _openListOption ? 220 : 58,
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 6),
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: _openListOption
                  ? BorderRadius.circular(25)
                  : BorderRadius.circular(50),
              border: Border.all(
                  color: const Color.fromARGB(255, 110, 125, 162), width: 1),
            ),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    'Unidade',
                    style: TextStyle(
                      fontFamily:
                          Theme.of(context).textTheme.bodyMedium?.fontFamily,
                      color: Theme.of(context).textTheme.labelMedium?.color,
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  trailing: GestureDetector(
                    onTap: () =>
                        setState(() => _openListOption = !_openListOption),
                    child: !_openListOption
                        ? Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 30,
                            color:
                                Theme.of(context).textTheme.labelLarge?.color,
                          )
                        : Icon(
                            Icons.keyboard_arrow_up_rounded,
                            size: 30,
                            color:
                                Theme.of(context).textTheme.labelLarge?.color,
                          ),
                  ),
                ),
                if (_openListOption)
                  Column(
                    children: [
                      Divider(
                        color: Theme.of(context).textTheme.labelLarge?.color,
                        height: 1,
                        endIndent: 20,
                      ),
                      SizedBox(
                        height: 50,
                        child: RadioListTile<RadioOption>(
                          value: RadioOption.clinic01,
                          groupValue: _radioOptionValue,
                          title: Text(
                            'Clínica da Saúde - Unidade 1',
                            style: TextStyle(
                              color: _firstClinicOption()
                                  ? Theme.of(context).colorScheme.tertiary
                                  : Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.color,
                            ),
                          ),
                          onChanged: (value) {
                            _onChangedRadioOption(value: value);
                          },
                          fillColor: WidgetStatePropertyAll(
                            !_firstClinicOption()
                                ? Theme.of(context).textTheme.labelLarge?.color
                                : Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: RadioListTile<RadioOption>(
                          value: RadioOption.clinic02,
                          groupValue: _radioOptionValue,
                          title: Text(
                            'Grupo Cuide Bem - Unidade 7',
                            style: TextStyle(
                              color: _secondClinicOption()
                                  ? Theme.of(context).colorScheme.tertiary
                                  : Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.color,
                            ),
                          ),
                          onChanged: (value) {
                            _onChangedRadioOption(value: value);
                          },
                          fillColor: WidgetStatePropertyAll(
                            !_secondClinicOption()
                                ? Theme.of(context).textTheme.labelLarge?.color
                                : Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        child: RadioListTile<RadioOption>(
                          value: RadioOption.clinic03,
                          groupValue: _radioOptionValue,
                          title: Text(
                            'Clínica da Família - Filial Leste',
                            style: TextStyle(
                              color: _thirdClinicOption()
                                  ? Theme.of(context).colorScheme.tertiary
                                  : Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.color,
                            ),
                          ),
                          onChanged: (value) {
                            _onChangedRadioOption(value: value);
                          },
                          fillColor: WidgetStatePropertyAll(
                            !_thirdClinicOption()
                                ? Theme.of(context).textTheme.labelLarge?.color
                                : Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
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
            width: double.infinity,
            height: 60,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  Theme.of(context).colorScheme.primary,
                ),
              ),
              onPressed: () {
                Provider.of<SignUpPageForm>(context, listen: false)
                    .toggleForm(value: SignUpForm.secondForm);
              },
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
