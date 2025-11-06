import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:physioapp/services/auth/auth_form.dart';

import 'package:physioapp/model/user/physio/physio_user.dart';
import 'package:physioapp/services/auth/physio/auth_physio_service.dart';
import 'package:physioapp/services/auth/physio/physio_endpoint.dart';

class AuthPhysioBackendService implements AuthPhysioService {
  final endpoints = PhysioEndpoint();

  static String? _globalToken;
  File? image;

  void _updatePhysioUser(
      {required dynamic user, File? imageProfile, RadioButton? physioType}) {
    _currentUserPhysio = PhysioUser(
      id: user['id'],
      crefito: user['crefito'],
      physioType: physioType ?? RadioButton.physioOption,
      imageProfile: imageProfile ?? File(''),
      name: user['fullname'],
      email: user['email'],
    );
  }

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
    final response = await endpoints.registerEndpoint(
      name: name,
      email: email,
      password: password,
      crefito: crefito,
    );

    try {
      final login = await endpoints.loginEndpoint(
        email: email,
        password: password,
      );

      try {
        final json = jsonDecode(login.body);
        final String? token = json['token'];

        if (token != null && token.isNotEmpty) {
          _globalToken = token;

          final current = await endpoints.meEndpoint(token: _globalToken!);

          final user = jsonDecode(current.body);
          image = imageProfile;

          _updatePhysioUser(
            user: user,
            imageProfile: image,
            physioType: physioType,
          );
        }
      } catch (error) {
        debugPrint(error.toString());
      }
    } catch (error) {
      debugPrint("ocorreu erro, deu ruim");
      debugPrint(response.body);
    }
  }

  @override
  Future<void> login({required String email, required String password}) async {
    final login = await endpoints.loginEndpoint(
      email: email,
      password: password,
    );

    try {
      final json = jsonDecode(login.body);
      final String? token = json['token'];

      if (token != null && token.isNotEmpty) {
        _globalToken = token;

        final current = await endpoints.meEndpoint(token: _globalToken!);

        final user = jsonDecode(current.body);
        debugPrint('User ===> $user');
        image = image;

        _updatePhysioUser(user: user, imageProfile: image);
      }
    } catch (error) {
      debugPrint("ocorreu erro, deu ruim");
      debugPrint(login.statusCode.toString());
      throw Exception(
        'Erro de acesso, verifique se o endereço de e-mail está correto',
      );
    }
  }

  @override
  Future<void> deleteAccount({required PhysioUser currentUser}) async {
    final response = await endpoints.deleteEndpoint(
        userId: currentUser.id, token: _globalToken!);

    try {
      debugPrint('Deu tudo certo');
    } catch (error) {
      debugPrint(response.toString());
    }
  }

  @override
  Future<void> updateUser(
      {PhysioUser? currentUser,
      String? password,
      String? name,
      String? email}) async {
    final response = await endpoints.updateEndpoint(
      currentUser: currentUser,
      name: name,
      email: email,
      token: _globalToken!,
      password: password,
    );

    try {
      debugPrint('deu bom');

      final current = await endpoints.meEndpoint(token: _globalToken!);

      final user = jsonDecode(current.body);

      _updatePhysioUser(
        user: user,
        physioType: RadioButton.physioOption,
        imageProfile: File(''),
      );
    } catch (error) {
      debugPrint(response.statusCode.toString());
      debugPrint('deu ruim');
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
