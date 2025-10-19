import 'package:flutter/material.dart';
import 'package:physioapp/components/physioterapist/exercises/exercises_list.dart';
import 'package:physioapp/model/exercises/category.dart';
import 'package:physioapp/services/exercises/exercise_controller.dart';

class ExercisesListPage extends StatelessWidget {
  const ExercisesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;
    final exercises = ExerciseController();
    // Filtrando por categoria
    final filteredList = exercises.listExercises.where(
      (exe) => exe.categoryId.contains(category.id),
    );

    print('list favorite ${exercises.listFavorites}');

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Container(
        width: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.builder(
          itemBuilder: (context, index) => ExercisesList(
            exercise: category.id == exercises.favoriteCategory
                ? exercises.listFavorites.elementAt(index)
                : filteredList.elementAt(index),
          ),
          itemCount: category.id == exercises.favoriteCategory
              ? exercises.listFavorites.length
              : filteredList.length,
        ),
      ),
    );
  }
}
