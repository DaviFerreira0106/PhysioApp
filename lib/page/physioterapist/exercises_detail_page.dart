import 'package:flutter/material.dart';
import 'package:physioapp/components/physioterapist/exercises/exercises_detail.dart';
import 'package:physioapp/components/physioterapist/exercises/exercises_steps.dart';
import 'package:physioapp/components/physioterapist/exercises/video_box.dart';

class ExercisesDetailPage extends StatelessWidget {
  const ExercisesDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercises Detail'),
      ),
      body: Column(
        children: [
          VideoBox(),
          ExercisesDetail(
            titleExercises: 'Relaxamento da Lombar',
            subtileExercises:
                'Aplicando tecnica de vedação para relaxar os musculos da lombar',
          ),
          ExerciseSteps(),
        ],
      ),
    );
  }
}
