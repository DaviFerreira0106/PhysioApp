import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:physioapp/utils/constants.dart';
import 'package:http/http.dart' as http;

class UserFisioController with ChangeNotifier {

  Future<void> createFisioUser({required Map<String, Object> formData}) async {
    final response = await http.post(
      Uri.parse('${Constants.fisioUserBaseUrl}.json'),
      body: jsonEncode({
        'email': formData['email'],
        'password': formData['password'],
        'numberCrefito': formData['numberCrefito'],
        'name': formData['name'],
        'telephone': formData['phone'],
      }),
    );

    final body = jsonDecode(response.body)['name'];
    print(body);
  }
}
