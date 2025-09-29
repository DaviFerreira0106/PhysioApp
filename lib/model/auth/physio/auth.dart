import 'dart:convert';
import 'dart:io';

import 'package:physioapp/model/auth/physio/auth_form.dart';
import 'package:http/http.dart' as http;

class Auth {
  Future<void> signUp(PhysioUser user) async {
    final response = await http.post(
      Uri.parse('http://localhost:8080/users'),
      body: {
        "user_type": "PHYSIO",
        "username": user.name,
        "fullname": user.name,
        "email": user.email,
        "phone": "555-5678",
        "password": user.password,
        "role": "PHYSIO",
        "crefito": user.crefito,
      },
    );

    print(jsonDecode(response.body));
  }
}

class PhysioUser {
  String crefito;
  RadioOption clinic;
  RadioButton physioType;
  File imageProfile;
  String name;
  String email;
  String password;

  PhysioUser({
    required this.crefito,
    required this.clinic,
    required this.physioType,
    required this.imageProfile,
    required this.name,
    required this.email,
    required this.password,
  });
}
