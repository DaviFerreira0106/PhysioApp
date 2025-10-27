import 'dart:io';

import 'package:physioapp/model/user/physio/physio_user.dart';
import 'package:physioapp/services/auth/physio/auth_physio_backend_service.dart';
import 'package:physioapp/services/auth/auth_form.dart';

abstract class AuthPhysioService {
  PhysioUser? get currentPhysioUser;

  Future<void> signUp({
    required RadioButton physioType,
    required File imageProfile,
    required String name,
    required String email,
    required String password,
    required String crefito,
  });

  Future<void> login({required String email, required String password});

  Future<void> logout();

  factory AuthPhysioService() {
    return AuthPhysioBackendService();
  }
}
