import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:physioapp/model/user/patient/patient_user.dart';
import 'package:physioapp/services/auth/auth_form.dart';
import 'package:physioapp/services/auth/patient/auth_patient_service.dart';

class AuthPatientBackendService implements AuthPatientService {
  String? _globalToken;
  File? image;
  // static const String _url = '10.8.121.9';
  // static const String _url = '192.168.15.3';
  static const String _url = '10.8.116.1';
  static PatientUser? _currentUserPatient;

  @override
  // TODO: implement currentPhysioUser
  PatientUser? get currentPatientUser => _currentUserPatient;

  @override
  Future<void> signUp({
    required File imageProfile,
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await http
        .post(
          Uri.parse('http://$_url:8080/auth/register'),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "user_type": "PATIENT",
            "fullname": name.toLowerCase(),
            "email": email.toLowerCase(),
            "password": password,
          }),
        )
        .timeout(
          const Duration(seconds: 5),
        );

    if (response.statusCode == 201) {
      debugPrint("ocorreu tudo bem");
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

          _currentUserPatient = PatientUser(
            id: user['id'].toString(),
            imageProfile: imageProfile,
            name: user['fullname'],
            email: user['email'],
          );
        }
      }
    } else {
      debugPrint("ocorreu erro, deu ruim");
      debugPrint(response.statusCode.toString());
    }
  }

  @override
  Future<void> login({required String email, required String password}) async {
    final login = await http
        .post(
          Uri.parse('http://$_url:8080/auth/login'),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "email": email.toLowerCase(),
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
        image = image;
        _currentUserPatient = PatientUser(
          id: user['id'].toString(),
          imageProfile: File(image?.path ?? ''),
          name: user['fullname'],
          email: user['email'],
        );
      }
    } else {
      throw Exception(
          'Erro de acesso, verifique se o endereço de e-mail está correto');
    }
  }

  @override
  Future<void> deleteAccount({required PatientUser currentUser}) async {
    final response = await http.delete(
      Uri.parse('http://$_url:8080/users/${currentUser.id}'),
      headers: {"Authorization": "Bearer $_globalToken"},
    );

    if (response.statusCode == 204) {
      debugPrint('Deu tudo certo');
    } else {
      debugPrint(response.toString());
    }
  }

  @override
  Future<void> updateUser({PatientUser? currentUser, String? password}) async {
    debugPrint(_globalToken);
    final response = await http.put(
      Uri.parse('http://$_url:8080/users/${currentUser?.id}'),
      headers: {"Authorization": "Bearer $_globalToken"},
      body: jsonEncode({
        "fullname": currentUser?.name.toLowerCase(),
        "email": currentUser?.email.toLowerCase(),
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      debugPrint('deu bom');
    } else {
      debugPrint(response.statusCode.toString());
      debugPrint('deu ruim');
    }
  }

  @override
  Future<void> logout() async {
    _currentUserPatient = null;
    _globalToken = null;
    AuthFormData.imageProfile = null;
  }
}
