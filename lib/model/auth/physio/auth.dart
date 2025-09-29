import 'dart:convert';
import 'dart:io';

import 'package:physioapp/model/auth/physio/auth_form.dart';
import 'package:http/http.dart' as http;

class Auth {
  Future<void> signUp({
     required String crefito,
     required RadioOption clinic,
     required RadioButton physioType,
     required File imageProfile,
     required String name,
     required String email,
     required String password,
  }) async {
    final response = await http.post(
      Uri.parse('http://localhost:8080/users'),
      body: {
        "user_type": "PHYSIO",
        "username": name,
        "fullname": name,
        "email": email,
        "phone": "555-5678",
        "password": password,
        "role": "PHYSIO",
        "crefito": crefito,
      },
    );

    print('json: ${jsonDecode(response.body)}');
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
