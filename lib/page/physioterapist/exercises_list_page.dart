import 'package:flutter/material.dart';
import 'package:physioapp/components/physioterapist/exercises/exercises_list.dart';
import 'package:physioapp/model/exercises/category.dart';

class ExercisesListPage extends StatelessWidget {
  const ExercisesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Container(
        width: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ExercisesList(
          titleExercises: 'Esticada de Perna (Quadriceps)',
          minute: 13,
          pathVideoCover: 'assets/images/background_image_auth_patient.jpg',
        ),
      ),
    );
  }
}
