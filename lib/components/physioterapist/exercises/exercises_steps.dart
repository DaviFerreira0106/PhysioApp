import 'package:flutter/material.dart';
import 'package:physioapp/components/physioterapist/exercises/step_exercise.dart';

class ExerciseSteps extends StatelessWidget {
  const ExerciseSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 350,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Como Fazer o Exercício',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    fontFamily:
                        Theme.of(context).textTheme.titleMedium?.fontFamily,
                  ),
                ),
                Text(
                  '3 Passos',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: SizedBox(
              height: 280,
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => StepExercise(
                  indexStep: index + 1,
                  titleStep: 'Posição corporal',
                  subtitleStep:
                      'Incline a cabeça levemente para baixo, fazendo seu queixo encostar no seu peito',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
