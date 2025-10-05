

import 'package:flutter/material.dart';

enum SignUpForm {
  firstForm,
  secondForm,
}

class SignUpPageForm with ChangeNotifier {
  //Configuração default do page form
  SignUpForm currentPageForm = SignUpForm.firstForm;

  // Gettera para acessar valores do enum
  SignUpForm get firstForm => SignUpForm.firstForm;
  SignUpForm get secondForm => SignUpForm.secondForm; 

  // Getters para verificar a página
  bool get firstPageForm => currentPageForm == SignUpForm.firstForm;
  bool get secondPageForm => currentPageForm == SignUpForm.secondForm;

  // Função para alterar de página
  void toggleForm({required SignUpForm value}) {
    print('valor recebido: $value');
    currentPageForm = value;
    notifyListeners();
  }
}
