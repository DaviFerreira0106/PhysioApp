import 'dart:io';

import 'package:physioapp/model/auth/physio/auth_form.dart';

class PhysioUser {
  String crefito;
  RadioButton physioType;
  File imageProfile;
  String name;
  String email;
  String password;

  PhysioUser({
    required this.crefito,
    required this.physioType,
    required this.imageProfile,
    required this.name,
    required this.email,
    required this.password,
  });

  String get getName => name;
}
