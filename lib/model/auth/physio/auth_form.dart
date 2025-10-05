import 'dart:io';

import 'package:flutter/material.dart';

enum RadioButton {
  physioOption,
  therapyOption,
}

enum PasswordType {
  password,
  confirmPassword,
}

class AuthForm with ChangeNotifier {
  // Atributos
  String? crefito;
  RadioButton? physioType;
  File? imageProfile;
  String? name;
  String? email;
  String? password;

  // Variaveis de controle
  RadioButton currentRadioValue = RadioButton.physioOption;
  RadioButton physioValue = RadioButton.physioOption;
  RadioButton therapyValue = RadioButton.therapyOption;
  PasswordType passwordType = PasswordType.password;
  PasswordType confirmPasswordType = PasswordType.confirmPassword;

  // Getters de acesso aos enum de controle
  bool get optionPhysioSelected => currentRadioValue == physioValue;
  bool get optionTherapySelected => currentRadioValue == therapyValue;
  bool get formPassword => passwordType == PasswordType.password;
  bool get formConfirmPassword => confirmPasswordType == PasswordType.confirmPassword;

  // Metodo para alteração de valor selecionado
  void onChangedRadioValue({required RadioButton? value}) {
    print(value);
    currentRadioValue = value ?? physioValue;
    notifyListeners();
  }
}
