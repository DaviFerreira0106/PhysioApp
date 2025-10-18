import 'package:physioapp/model/exercises/exercise.dart';
import 'package:physioapp/data/exercises_mock_data.dart';

class ExerciseController {
  final List<Exercise> _listExercises = ExercisesMockData.exercisesList;

  List<Exercise> get listExercises => [..._listExercises];

  int get itemsAcount => _listExercises.length;
}