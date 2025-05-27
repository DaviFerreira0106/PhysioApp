import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:physioapp/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:physioapp/utils/secure.dart';
import 'package:crypto/crypto.dart' as crypto;

class UserFisioController with ChangeNotifier {
  Future<void> createFisioUser({required Map<String, Object> formData}) async {
    // Criptografando os dados
    final key = encrypt.Key.fromUtf8(Secure.key);
    final iv = encrypt.IV.fromLength(16);

    final objEncrypter = encrypt.Encrypter(encrypt.AES(key));
    final emailCipher =
        objEncrypter.encrypt(formData['email'] as String, iv: iv);
    final crefitoCipher =
        objEncrypter.encrypt(formData['numberCrefito'] as String, iv: iv);
    final nameCipher = objEncrypter.encrypt(formData['name'] as String, iv: iv);
    final phoneCipher =
        objEncrypter.encrypt(formData['phone'] as String, iv: iv);

    // Senha
    final String password = formData['password'] as String;
    final bytesPassword = utf8.encode(password + Secure.salt);
    final passwordHash = crypto.sha256.convert(bytesPassword);

    final response = await http.post(
      Uri.parse('${Constants.fisioUserBaseUrl}.json'),
      body: jsonEncode({
        'email': emailCipher.base64,
        'password': passwordHash.toString(),
        'numberCrefito': crefitoCipher.base64,
        'name': nameCipher.base64,
        'telephone': phoneCipher.base64,
      }),
    );

    final body = jsonDecode(response.body)['name'];
    print(body);
  }
}
