import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String name = 'davi';
String email = 'davi@mail.com';
String password = '123456';
String crefito = '414243';

Future<void> main() async {
  try {
    final response = await http.post(
      Uri.parse('http://localhost:8080/users'),
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
    } else {
      debugPrint("ocorreu deu ruim");
      debugPrint(response.body);
    }
  } catch (e) {
    debugPrint("ocorreu deu ruim porque: $e");
  }
}
