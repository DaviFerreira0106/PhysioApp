import 'package:flutter/material.dart';

enum FormExercise {
  firstForm,
  secondForm,
}

class ExercisesControllerForm with ChangeNotifier {
  static List<Widget> stepsExercises = [];

  Future<void> addStep({
    required Widget titleTextForm,
    required Widget descriptionTextForm,
  }) async {
    stepsExercises.addAll([titleTextForm, descriptionTextForm]);
    notifyListeners();
  }

  FormExercise _currentForm = FormExercise.firstForm;
  FormExercise get currentForm => _currentForm;

  FormExercise get getFirstForm => FormExercise.firstForm;
  FormExercise get getSecondForm => FormExercise.secondForm;

  bool get firstForm => _currentForm == FormExercise.firstForm;
  bool get secondForm => _currentForm == FormExercise.secondForm;

  void toggleForm({required FormExercise valueForm}) {
    _currentForm = valueForm;
    notifyListeners();
  }
}
