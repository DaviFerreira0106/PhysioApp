import 'package:flutter/material.dart';
import 'package:physioapp/components/physioterapist/exercises/first_add_exercise_form.dart';
import 'package:physioapp/components/physioterapist/exercises/second_add_exercise_form.dart';
import 'package:physioapp/components/physioterapist/exercises/select_form_exercises.dart';
import 'package:physioapp/services/exercises/exercises_controller_form.dart';
import 'package:provider/provider.dart';

class AddExercisePage extends StatelessWidget {
  const AddExercisePage({super.key});

  @override
  Widget build(BuildContext context) {
    final exerciseForm = Provider.of<ExercisesControllerForm>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Adicionar Exercício')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 60,
              ),
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                top: 16,
                bottom: 24,
              ),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 223, 224, 234),
                    Color.fromARGB(255, 233, 235, 240),
                  ],
                ),
                borderRadius: BorderRadius.circular(28),
              ),
              child: Column(
                children: [
                  if (exerciseForm.firstForm) const FirstAddExerciseForm(),
                  if (exerciseForm.secondForm) const SecondAddExerciseForm(),
                  const SizedBox(height: 10),
                  SelectFormExercises(
                    exerciseForm: exerciseForm,
                  ),
                  Row(
                    mainAxisAlignment: exerciseForm.firstForm
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      exerciseForm.firstForm
                          ? TextButton(
                              onPressed: () {
                                exerciseForm.toggleForm(
                                  valueForm: exerciseForm.getSecondForm,
                                );
                              },
                              child: const Text('Proximo'),
                            )
                          : TextButton(
                              onPressed: () {
                                exerciseForm.toggleForm(
                                  valueForm: exerciseForm.getFirstForm,
                                );
                              },
                              child: const Text('Voltar'),
                            ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
