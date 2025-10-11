import 'package:flutter/material.dart';
import 'package:physioapp/components/physioterapist/exercises/exercises_list.dart';

class ExercisesListPage extends StatelessWidget {
  const ExercisesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Exercises'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ExercisesList(
          exerciseName: 'Esticada de Perna (Quadriceps)',
          minute: 13,
          pathVideoCover: 'assets/images/background_image_auth_patient.jpg',
        ),
      ),
    );
  }
}
