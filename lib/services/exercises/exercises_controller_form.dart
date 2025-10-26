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

  String? videoUrl;
  double? durationVideo;
  bool _nextForm = false;
  bool _enableNextButton = false;
  int _quanditySteps = 1;

  int get quanditySteps => _quanditySteps;

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

  void stepAdded() {
    if (stepsExercise.isNotEmpty) {
      _nextForm = true;
      notifyListeners();
    }
  }

  void advanceForm() {
    _enableNextButton = true;
    notifyListeners();
  }

  void addStep({required String titleStep, required String descriptionStep}) {
    if (stepsExercise.isEmpty) {
      stepsExercise.add({titleStep: descriptionStep});
    } else if (stepsExercise.last.entries.last.key != titleStep &&
        stepsExercise.last.entries.last.value != descriptionStep) {
      stepsExercise.add({titleStep: descriptionStep});
    }

    stepAdded();
    notifyListeners();
  }

  void addLenghtListStep() {
    _quanditySteps += 1;
    notifyListeners();
  }

  void resetSteps() {
    _quanditySteps = 1;
    stepsExercise = [];
    titleStep = '';
    descriptionStep = '';
    titleExercise = '';
    descriptionExercise = '';
    durationVideo = null;
    _nextForm = false;
    _enableNextButton = false;
    notifyListeners();
  }
}
