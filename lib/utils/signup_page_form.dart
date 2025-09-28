

import 'package:flutter/material.dart';

enum SignUpForm {
  firstForm,
  secondForm,
}

class SignUpPageForm with ChangeNotifier {
  SignUpPageForm({
    bool? firstForm,
    bool? secondForm,
  });

  SignUpForm signUpPageForm = SignUpForm.firstForm;
  bool firstPageForm() => signUpPageForm == SignUpForm.firstForm;

  void toggleForm({required SignUpForm value}) {
    print('valor recebido: $value');
    signUpPageForm = value;
    notifyListeners();
  }
}
