import 'package:flutter/material.dart';

enum SignUpForm {
  firstForm,
  secondForm,
}

class SignUpPageForm with ChangeNotifier {
  bool _isLoadind = false;

  bool get isLoading => _isLoadind;

  void toggleLoadingValue() {
    _isLoadind = !_isLoadind;
    notifyListeners();
  }

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
    currentPageForm = value;
    notifyListeners();
  }
}
