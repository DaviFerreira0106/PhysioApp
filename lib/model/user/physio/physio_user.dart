import 'dart:io';

import 'package:physioapp/services/auth/auth_form.dart';

class PhysioUser {
  final String id;
  final String crefito;
  final RadioButton physioType;
  File imageProfile;
  final String name;
  final String email;

  PhysioUser({
    required this.id,
    required this.crefito,
    required this.physioType,
    required this.imageProfile,
    required this.name,
    required this.email,
  });

  String get firstName {
    final first = name.split(' ')[0];
    final nameFormted =
        first.substring(0, 1).toUpperCase() + first.substring(1);
    return nameFormted;
  }

  String get userName {
    final nameSplitted = name.split(' ');

    final firstPart = nameSplitted.first.substring(0, 1).toUpperCase() +
        nameSplitted.first.substring(1);

    final lastPart = nameSplitted.last.substring(0, 1).toUpperCase() +
        nameSplitted.last.substring(1);
    return '$firstPart $lastPart';
  }

  String obscureText(String text) {
    return text.substring(0).replaceRange(0, text.length, '*****');
  }
}
