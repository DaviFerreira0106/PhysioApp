import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:physioapp/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:physioapp/utils/secure.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:physioapp/models/fisio_user.dart';

class UserFisioController with ChangeNotifier {
  FisioUser? _fisioUser;

  FisioUser get fisioUser => _fisioUser!;

  Future<void> createFisioUser(
      {required Map<String, Object> formData, required String uid}) async {
    // Método para criar usuário fisioterapeuta
    _addFisioUser(formData: formData, uid: uid);

    

    await http.post(
      Uri.parse('${Constants.fisioUserBaseUrl}.json'),
      body: jsonEncode({
        'uid': uidCipher.base64,
        'email': emailCipher.base64,
        'password': passwordHash.toString(),
        'numberCrefito': crefitoCipher.base64,
        'name': nameCipher.base64,
        'telephone': phoneCipher.base64,
      }),
    );
  }

  void _addFisioUser(
      {required Map<String, Object> formData, required String uid}) {
    // Salvo Usuario na lista

    _fisioUser = FisioUser(
      id: uid,
      name: formData['name'] as String,
      numberCrefito: formData['numberCrefito'] as String,
      email: formData['email'] as String,
      numberTelephone: formData['phone'] as String,
      password: formData['password'] as String,
    );

    notifyListeners();
  }

  Future<void> loadFisioUser() async {
    final response =
        await http.get(Uri.parse('${Constants.fisioUserBaseUrl}.json'));

    if (response.body == 'null') return;

    Map<String, dynamic> data = jsonDecode(response.body);

    data.forEach((key, value) {
      // Criando chaves de criptografia
      final key = encrypt.Key.fromUtf8(Secure.key);
      final iv = encrypt.IV.fromLength(16);

      // Criando objeto de critação
      print('Chave part2: ${Secure().k}');
      print('iv part2: ${Secure().iv}');
      final objEncrypter = encrypt.Encrypter(encrypt.AES(Secure().k!));
      final emailCipher =
          encrypt.Encrypted.fromBase64(value['email'] as String);
      final data = objEncrypter.decrypt(emailCipher, iv: Secure().iv);
      print(data);
      // final fisioUser = FisioUser(
      //   id: id,
      //   name: name,
      //   numberCrefito: numberCrefito,
      //   email: email,
      //   numberTelephone: numberTelephone,
      //   password: password,
      // );
    });
  }
}
