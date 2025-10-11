import 'package:flutter/material.dart';
import 'package:physioapp/components/physioterapist/exercises/step_exercise.dart';

class ExerciseSteps extends StatelessWidget {
  const ExerciseSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Como Fazer o Exercício'),
              Text('3 Passos'),
            ],
          ),
        ],
      ),
    );
  }
}
