import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:physioapp/model/user/patient/patient_user.dart';
import 'package:physioapp/services/auth/auth_form.dart';
import 'package:physioapp/services/auth/patient/auth_patient_service.dart';

class AuthPatientBackendService implements AuthPatientService {
  // static const String _url = '10.8.121.9';
  static const String _url = '192.168.15.3';
  // static const String _url = '10.8.116.1';
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
    final response = await http.post(
      Uri.parse('http://$_url:8080/auth/register'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "user_type": "PATIENT",
        "username": name.toLowerCase(),
        "fullname": name.toLowerCase(),
        "email": email,
        "phone": "555-1234",
        "password": password,
        "role": "PATIENT"
      }),
    );

    if (response.statusCode == 201) {
      debugPrint("ocorreu tudo bem");
      final data = jsonDecode(response.body);

      _currentUserPatient = PatientUser(
        id: data['id'].toString(),
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
    final login = await http.post(
      Uri.parse('http://$_url:8080/auth/login'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );

    debugPrint(login.body);
  }

  @override
  Future<void> logout() async {
    _currentUserPatient = null;
    AuthFormData.imageProfile = null;
  }
}
