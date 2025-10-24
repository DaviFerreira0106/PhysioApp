import 'package:flutter/material.dart';

class ExercisesFormData with ChangeNotifier {
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
  int _index = 0;

  bool get getNextForm => _nextForm;
  bool get getEnableNextButton => _enableNextButton;

  String getKeyList() {
    if (_index < listKeys.length) {
      final key = listKeys.elementAt(_index);
      _index += 1;
      return key;
    } else {
      return listKeys.elementAt(_index);
    }
  }

  void addList() {
    for (final map in stepsExercise) {
      for (final key in map.keys) {
        listKeys.add(key);
      }
      for (final value in map.values) {
        listValues.add(value);
      }
      notifyListeners();
    }
    print(listKeys);
    print(listValues);
  }

  void stepAdded() {
    print(stepsExercise.isNotEmpty);
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
    print(stepsExercise);
    notifyListeners();
  }
}
