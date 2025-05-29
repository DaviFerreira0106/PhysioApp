import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:physioapp/utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:physioapp/utils/encrypter.dart';
import 'package:physioapp/models/fisio_user.dart';

class UserFisioController with ChangeNotifier {
  FisioUser? _fisioUser;

  FisioUser get fisioUser => _fisioUser!;

  Future<void> createFisioUser(
      {required Map<String, Object> formData, required String uid}) async {
    // Método para criar usuário fisioterapeuta
    _addFisioUser(formData: formData, uid: uid);

    final data = Encrypter().encrypter(data: formData, uid: uid);

    await http.post(
      Uri.parse('${Constants.fisioUserBaseUrl}.json'),
      body: jsonEncode({
        'uid': data['uid'] as String,
        'email': data['email'] as String,
        'password': data['password'] as String,
        'numberCrefito': data['numberCrefito'] as String,
        'name': data['name'] as String,
        'telephone': data['phone'] as String,
      }),
    );

    // Limpando dados das variaveis
    formData.clear();
    uid = '';
    notifyListeners();
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
      idBD: '',
    );

    notifyListeners();
  }

  Future<void> loadFisioUser() async {
    final response =
        await http.get(Uri.parse('${Constants.fisioUserBaseUrl}.json'));

    if (response.body == 'null') return;

    Map<String, dynamic> data = jsonDecode(response.body);
    data.forEach((key, value) {
      final data = Encrypter().decrypter(data: value);
      final fisioUser = FisioUser(
          id: data['uid'] as String,
          name: data['name'] as String,
          numberCrefito: data['numberCrefito'] as String,
          email: data['email'] as String,
          numberTelephone: data['phone'] as String,
          idBD: key);
      _fisioUser = fisioUser;
      notifyListeners();
    });
  }

  Future<void> updateFisioUser({required Map<String, Object> formData}) async {
    final data = Encrypter().updateEncrypter(data: formData, uid: fisioUser.id);
    await http.patch(
        Uri.parse('${Constants.fisioUserBaseUrl}/${fisioUser.idBD}.json'),
        body: jsonEncode({
          'email': data['email'] as String,
          'name': data['name'] as String,
          'numberCrefito': data['numberCrefito'] as String,
          'telephone': data['phone'] as String,
        }));
    notifyListeners();
    return Future.value();
  }

  Future<void> deleteAccount() async {
    await http.delete(
      Uri.parse("${Constants.fisioUserBaseUrl}/${fisioUser.idBD}.json"),
    );

    notifyListeners();
  }
}
