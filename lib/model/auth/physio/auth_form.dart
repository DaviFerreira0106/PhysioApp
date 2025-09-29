import 'dart:io';

enum RadioOption {
  clinic01,
  clinic02,
  clinic03,
}

enum RadioButton {
  physioOption,
  therapyOption,
}

class AuthForm {
  String? crefito;
  RadioOption? clinic;
  RadioButton? physioType;
  File? imageProfile;
  String? name;
  String? email;
  String? password;
}