import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:physioapp/services/auth/auth_form.dart';
import 'package:http/http.dart' as http;
import 'package:physioapp/model/user/physio/physio_user.dart';
import 'package:physioapp/services/auth/physio/auth_physio_service.dart';

class AuthPhysioBackendService implements AuthPhysioService {
  // static const String _url = '10.8.121.9';
  static const String _url = '192.168.15.3';
  // static const String _url = '10.8.116.1';
  static PhysioUser? _currentUserPhysio;

  @override
  // TODO: implement currentPhysioUser
  PhysioUser? get currentPhysioUser => _currentUserPhysio;

  @override
  Future<void> signUp({
    required RadioButton physioType,
    required File imageProfile,
    required String name,
    required String email,
    required String password,
    required String crefito,
  }) async {
    print('crefito $crefito');
    final response = await http.post(
      Uri.parse('http://$_url:8080/auth/register'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "fullname": name.toLowerCase(),
        "email": email.toLowerCase(),
        "password": password,
        "user_type": "PHYSIO",
        "crefito": crefito,
      }),
    );

    if (response.statusCode == 201) {
      debugPrint("ocorreu tudo bem");
      final data = jsonDecode(response.body);
      print(data);
      _currentUserPhysio = PhysioUser(
        id: data['id'].toString(),
        crefito: data['crefito'],
        physioType: physioType,
        imageProfile: imageProfile,
        name: data['fullname'],
        email: data['email'],
      );
    } else {
      debugPrint("ocorreu erro, deu ruim");
      debugPrint(response.body);
    }
  }

  @override
  Future<void> login({required String email, required String password}) async {
    final response = await http.post(
      Uri.parse('http://$_url:8080/auth/register'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email.toLowerCase(),
        "password": password,
      }),
    );

    if (response.statusCode == 201) {
      debugPrint("ocorreu tudo bem");
      final data = jsonDecode(response.body);

      debugPrint(data);

      // _currentUserPhysio = PhysioUser(
      //   id: data['id'].toString(),
      //   crefito: data['crefito'],
      //   physioType: physioType,
      //   imageProfile: imageProfile,
      //   name: data['fullname'],
      //   email: data['email'],
      // );
    } else {
      debugPrint("ocorreu erro, deu ruim");
      debugPrint(response.body);
    }
  }

  @override
  Future<void> logout() async {
    _currentUserPhysio = null;
    AuthFormData.crefito = null;
    AuthFormData.imageProfile = null;
  }
}
