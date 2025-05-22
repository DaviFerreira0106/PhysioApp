import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthController with ChangeNotifier {
  Future<void> _authenticate({
    required String email,
    required String password, 
    required String urlFragment,
  }) async {
    final String _url = 'https://identitytoolkit.googleapis.com/v1/accounts:$urlFragment?key=AIzaSyDfmSm9hXz8Dz1qJdvdwh4dwjqTJEo86w0';

    final response = await http.post(
      Uri.parse(_url),
      body: jsonEncode({
        'email': email,
        'password': password,
        'returnSecureToken': true,
      }),
      );

      print(response.body);
  }

  Future<void> signup({required String email, required String password}) async {
    return _authenticate(email: email, password: password, urlFragment: 'signUp');
  }

  Future<void> signin({required String email, required String password}) async {
    return _authenticate(email: email, password: password, urlFragment: 'signInWithPassword');
  }
}