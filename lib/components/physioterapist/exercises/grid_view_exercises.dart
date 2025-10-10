import 'package:flutter/material.dart';
import 'package:physioapp/components/physioterapist/exercises/box_exercises_type.dart';

class GridViewExercises extends StatelessWidget {
  const GridViewExercises({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 3.2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemBuilder: (context, index) => BoxExercisesType(
        title: 'Pernas',
        subtitle: 'Exercícios para trabalhar os quadriceps e posteriores',
        colors: Theme.of(context).colorScheme.primary,
      ),
      itemCount: 6,
    );
  }
}
