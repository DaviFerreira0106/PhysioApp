import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:physioapp/services/auth/auth_form.dart';
import 'package:http/http.dart' as http;
import 'package:physioapp/model/user/physio/physio_user.dart';
import 'package:physioapp/services/auth/physio/auth_physio_service.dart';

class AuthPhysioBackendService implements AuthPhysioService {
  String? _globalToken;
  File? image;
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
    final response = await http
        .post(
          Uri.parse('http://$_url:8080/auth/register'),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "fullname": name,
            "email": email,
            "password": password,
            "user_type": "PHYSIO",
            "crefito": crefito,
          }),
        )
        .timeout(
          const Duration(seconds: 5),
        );

    if (response.statusCode == 201) {
      final login = await http.post(
        Uri.parse('http://$_url:8080/auth/login'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      if (login.statusCode == 200) {
        final json = jsonDecode(login.body);
        String? token = json['token'];
        if (token != null && token.isNotEmpty) {
          _globalToken = token;

          final current = await http.get(
            Uri.parse('http://$_url:8080/users/me'),
            headers: {"Authorization": "Bearer $_globalToken"},
          );

          final user = jsonDecode(current.body);
          image = imageProfile;
          _currentUserPhysio = PhysioUser(
            id: user['id'],
            crefito: user['crefito'],
            physioType: physioType,
            imageProfile: imageProfile,
            name: user['fullname'],
            email: user['email'],
          );
        }
      }
    } else {
      debugPrint("ocorreu erro, deu ruim");
      debugPrint(response.body);
    }
  }

  @override
  Future<void> login({required String email, required String password}) async {
    final login = await http
        .post(
          Uri.parse('http://$_url:8080/auth/login'),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "email": email,
            "password": password,
          }),
        )
        .timeout(
          const Duration(seconds: 5),
        );

    if (login.statusCode == 200) {
      final json = jsonDecode(login.body);
      String? token = json['token'];
      if (token != null && token.isNotEmpty) {
        _globalToken = token;

        final current = await http.get(
          Uri.parse('http://$_url:8080/users/me'),
          headers: {"Authorization": "Bearer $_globalToken"},
        );

        final user = jsonDecode(current.body);
        debugPrint('User ===> $user');
        image = image;
        _currentUserPhysio = PhysioUser(
          id: user['id'],
          crefito: user['crefito'],
          physioType: RadioButton.physioOption,
          imageProfile: File(image?.path ?? ''),
          name: user['fullname'],
          email: user['email'],
        );
      }
    } else {
      debugPrint("ocorreu erro, deu ruim");
      debugPrint(login.body);
    }
  }

  @override
  Future<void> logout() async {
    _currentUserPhysio = null;
    _globalToken = null;
    AuthFormData.crefito = null;
    AuthFormData.imageProfile = null;
  }
}
