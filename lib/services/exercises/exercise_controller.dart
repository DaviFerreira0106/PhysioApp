import 'dart:math';

import 'package:flutter/material.dart';
import 'package:physioapp/model/exercises/category.dart';
import 'package:physioapp/model/exercises/exercise.dart';
import 'package:physioapp/data/exercises_mock_data.dart';
import 'package:physioapp/services/exercises/exercises_controller_form.dart';

class ExerciseController with ChangeNotifier {
  final List<Exercise> _listExercises = ExercisesMockData().exercisesList;

  List<Exercise> get listExercises => [..._listExercises];

  List<Exercise> get listFavorites => _listExercises
      .where(
        (exercise) => exercise.isFavorite == true,
      )
      .toList();

  int get itemsAcount => _listExercises.length;

  CategoryId get favoriteCategory => CategoryId.favorites;

  void addExercises({required ExercisesControllerForm formExercise}) {
    final newExercise = Exercise(
      id: Random().nextDouble().toString(),
      name: formExercise.titleExercise!,
      description: formExercise.descriptionExercise!,
      videoUrl: '',
      videoDuration: formExercise.durationVideo!,
      steps: formExercise.stepsExercise,
      categoryId: [CategoryId.personalized],
    );

    _listExercises.add(newExercise);
    notifyListeners();
  }

  void toggleFavorite({required String exerciseId}) {
    final exerciseLocalized = _listExercises
        .where((exercise) => exercise.id == exerciseId)
        .toList()
        .first;
    exerciseLocalized.isFavorite = !exerciseLocalized.isFavorite;

    notifyListeners();
  }
}
