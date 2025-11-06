import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:physioapp/model/user/physio/physio_user.dart';

class PhysioEndpoint {
  // static const String _url = 'http://10.8.121.9:8080';
  // static const String _url = 'http://192.168.15.3:8080';
  static const String _url = 'http://10.8.116.1:8080';

  Future<http.Response> registerEndpoint({
    required String name,
    required String email,
    required String password,
    required String crefito,
  }) async {
    return await http
        .post(
          Uri.parse('$_url/auth/register'),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "fullname": name.toLowerCase(),
            "email": email.toLowerCase(),
            "password": password,
            "user_type": "PHYSIO",
            "crefito": crefito,
          }),
        )
        .timeout(
          const Duration(seconds: 5),
        );
  }

  Future<http.Response> loginEndpoint(
      {required String email, required String password}) async {
    return await http
        .post(
          Uri.parse('$_url/auth/login'),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "email": email,
            "password": password,
          }),
        )
        .timeout(
          const Duration(seconds: 5),
        );
  }

  Future<http.Response> meEndpoint({required String token}) async {
    return await http.get(
      Uri.parse('$_url/users/me'),
      headers: {"Authorization": "Bearer $token"},
    ).timeout(
      const Duration(seconds: 5),
    );
  }

  Future<http.Response> deleteEndpoint({required String userId, required String token}) async {
    return await http.delete(
      Uri.parse('$_url/users/$userId'),
      headers: {"Authorization": "Bearer $token"},
    ).timeout(
      const Duration(seconds: 5),
    );
  }

  Future<http.Response> updateEndpoint({
    required PhysioUser? currentUser,
    required String token,
    String? name,
    String? email,
    String? password,
  }) async {
    return await http
        .put(
          Uri.parse('$_url/users/${currentUser?.id}'),
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
          body: jsonEncode({
            "fullname": name?.toLowerCase() ?? currentUser?.name.toLowerCase(),
            "email": email?.toLowerCase() ?? currentUser?.email.toLowerCase(),
            "password": password,
          }),
        )
        .timeout(
          const Duration(seconds: 5),
        );
  }
}