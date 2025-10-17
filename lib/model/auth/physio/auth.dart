import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:physioapp/model/auth/physio/auth_form.dart';
import 'package:http/http.dart' as http;
import 'package:physioapp/model/user/physio/physio_user.dart';

class Auth {
  static const String url = '192.168.15.8';
  static PhysioUser? currentUserPhysio;

  Future<void> signUp({
    required RadioButton physioType,
    required File imageProfile,
    required String name,
    required String email,
    required String password,
    required String crefito,
  }) async {
    final response = await http.post(
      Uri.parse('http://$url:8080/users'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "user_type": "PHYSIO",
        "username": name,
        "fullname": name,
        "email": email,
        "phone": "555-5678",
        "password": password,
        "role": "PHYSIO",
        "crefito": crefito,
      }),
    );

    if (response.statusCode == 201) {
      debugPrint("ocorreu tudo bem");
      debugPrint(response.body);
      currentUserPhysio = PhysioUser(
        crefito: crefito,
        physioType: physioType,
        imageProfile: imageProfile,
        name: name,
        email: email,
        password: password,
      );
    } else {
      debugPrint("ocorreu erro, deu ruim");
      debugPrint(response.body);
    }
  }

  Future<void> login({required String email, required String password}) async {
    http.get(Uri.parse('http://$url:8080/users'));
  }

  Future<void> logout() async {
    currentUserPhysio = null;
  }
}
