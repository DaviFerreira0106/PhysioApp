import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:physioapp/exceptions/auth_exception.dart';
import 'package:physioapp/controller/user_fisio_controller.dart';
import 'package:physioapp/exceptions/reset_password_exception.dart';
import 'package:physioapp/utils/logger.dart';

class AuthController with ChangeNotifier {
  String? _token;
  String? _email;
  String? _uid;
  DateTime? _expireToken;
  Timer? _timerExpireToken;

  bool get isAuth {
    final bool isValid = _expireToken?.isAfter(DateTime.now()) ?? false;
    return _token != null && isValid;
  }

  String? get token => isAuth ? _token : null;

  String? get email => isAuth ? _email : null;

  String? get uid => isAuth ? _uid : null;

  // Método de autenticação
  Future<void> _authenticate({
    required Map<String, Object> formData,
    required String urlFragment,
  }) async {
    final String _url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlFragment?key=AIzaSyDfmSm9hXz8Dz1qJdvdwh4dwjqTJEo86w0';

    //logger.info('Login User: $email');

    final response = await http.post(
      Uri.parse(_url),
      body: jsonEncode({
        'email': formData['email'] as String,
        'password': formData['password'] as String,
        'returnSecureToken': true,
      }),
    );

    final body = jsonDecode(response.body);

    if (body['error'] != null) {
      //logger.error('Failed login user: ${body["error"]}');
      throw AuthExceptions(error: body['error']['message']);
    } else {
      _token = body['idToken'];
      _email = body['e-mail'];
      _uid = body['localId'];
      _expireToken = DateTime.now().add(
        Duration(seconds: int.parse(body['expiresIn'])),
      );

      if (urlFragment == 'signUp') {
        await UserFisioController().createFisioUser(
          formData: formData,
          uid: _uid ?? '',
        );
      }

      _autoLogout();
      notifyListeners();
    }
  }

  // Método Signup
  Future<void> signup({required Map<String, Object> formData}) async {
    return _authenticate(formData: formData, urlFragment: 'signUp');
  }

  // Método Signin
  Future<void> signin({required Map<String, Object> formData}) async {
    return _authenticate(formData: formData, urlFragment: 'signInWithPassword');
  }

  // Método Recuperação de Senha
  Future<void> resetPassword({required String email}) async {
    const _url =
        'https://identitytoolkit.googleapis.com/v1/accounts:sendOobCode?key=AIzaSyDfmSm9hXz8Dz1qJdvdwh4dwjqTJEo86w0';

    //logger.info('Password reset: $email');

    final response = await http.post(
      Uri.parse(_url),
      body: jsonEncode({'requestType': 'PASSWORD_RESET', 'email': email}),
    );

    final body = jsonDecode(response.body);
    if (body['error'] != null) {
      //logger.info('Failed password reset: ${body["error"]}');
      throw ResetPasswordExceptions(error: body['error']['message']);
    }
  }

  Future<void> deleteAccount() async {
    const deleteUrl =
        'https://identitytoolkit.googleapis.com/v1/accounts:delete?key=AIzaSyDfmSm9hXz8Dz1qJdvdwh4dwjqTJEo86w0';
    await http.post(Uri.parse(deleteUrl),
        body: jsonEncode({
          'idToken': _token,
        }));
    notifyListeners();
  }

  void logout() {
    _token = null;
    _email = null;
    _uid = null;
    _expireToken = null;
    _clearAutoLogout();
    notifyListeners();
  }

  void _clearAutoLogout() {
    _timerExpireToken?.cancel();
    _timerExpireToken = null;
  }

  void _autoLogout() {
    _clearAutoLogout();
    final int tokenTemp =
        _expireToken?.difference(DateTime.now()).inSeconds ?? 0;

    _timerExpireToken = Timer(Duration(seconds: tokenTemp), logout);
  }
}
