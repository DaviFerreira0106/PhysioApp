import 'package:flutter/material.dart';

enum FormExercise {
  firstForm,
  secondForm,
}

class ExercisesControllerForm with ChangeNotifier {
  String? titleExercise;
  String? descriptionExercise;
  String? titleStep;
  String? descriptionStep;
  List<Map<String, String>> stepsExercise = [];
  List<String> listKeys = [];
  List<String> listValues = [];
  String? videoUrl;
  int? durationVideo;
  bool _nextForm = false;
  bool _enableNextButton = false;

  bool get getNextForm => _nextForm;
  bool get getEnableNextButton => _enableNextButton;

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

  void addList() {
    for (final map in stepsExercise) {
      for (final key in map.keys) {
        listKeys.add(key);
      }
      for (final value in map.values) {
        listValues.add(value);
      }
    }
    notifyListeners();
  }

  void stepAdded() {
    if (stepsExercise.isNotEmpty) {
      _nextForm = true;
      addList();
      notifyListeners();
    }
  }

  void advanceForm() {
    _enableNextButton = true;
    addList();
    notifyListeners();
  }

  void addStep({required String titleStep, required String descriptionStep}) {
    stepsExercise.addAll([
      {titleStep: descriptionStep}
    ]);

    stepAdded();
    notifyListeners();
  }

  int _quanditySteps = 0;

  int get quanditySteps => _quanditySteps;

  void addLenghtListStep() {
    _quanditySteps += 1;
    notifyListeners();
  }

  void resetSteps() {
    _quanditySteps = 0;
    stepsExercise.clear();
    listKeys.clear();
    listValues.clear();
    titleStep = '';
    descriptionStep = '';
    _nextForm = false;
    _enableNextButton = false;
    notifyListeners();
  }
}
