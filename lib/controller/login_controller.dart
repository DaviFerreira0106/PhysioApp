import 'package:flutter/material.dart';
import 'package:physioapp/models/fisio_user.dart';
import 'package:physioapp/data/auth_data.dart';
import 'dart:math';

class LoginController with ChangeNotifier {
  final List<FisioUser> _listUser = [];
  bool currentUserState = false;

  void nemFisioUser({required Map<String, Object> data}) {

    final user = FisioUser(
      id: Random().nextDouble().toString(),
      name: data["name"] as String,
      numberCrefito: ["numberCrefito"] as String,
      email: ["email"] as String,
      numberTelephone: ["phone"] as String,
      password: ["password"] as String,
    );

    _listUser.add(user);
    currentUserState = true;
    notifyListeners();
  }

  void currentUser(FisioUser user) {
    currentUserState = _listUser.contains(user.id);
    notifyListeners();
  }
}
