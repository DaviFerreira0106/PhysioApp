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
    final exerciseFormProvider = Provider.of<ExercisesControllerForm>(context);

    void showConfirmForm() {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog.adaptive(
              title: Text('Avançar?'),
              content: Text(
                  'Após processeguir você não poderá retornar a edição das etapas'),
              actions: [
                TextButton(
                  onPressed: () {
                    exerciseFormProvider.toggleForm(
                      valueForm: exerciseFormProvider.getSecondForm,
                    );

                    Navigator.of(context).pop();
                  },
                  child: Text('Sim'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Não'),
                ),
              ],
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
            exerciseFormProvider.resetSteps();
            exerciseFormProvider.toggleForm(
                valueForm: exerciseFormProvider.getFirstForm);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
          ),
        ),
        title: const Text('Adicionar Exercício'),
      ),
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
                  if (exerciseFormProvider.firstForm) FirstAddExerciseForm(),
                  if (exerciseFormProvider.secondForm)
                    const SecondAddExerciseForm(),
                  const SizedBox(height: 10),
                  SelectFormExercises(
                    exerciseForm: exerciseFormProvider,
                  ),
                  Row(
                    mainAxisAlignment: exerciseFormProvider.firstForm
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      if (exerciseFormProvider.firstForm)
                        TextButton(
                          onPressed: () {
                            if (exerciseFormProvider.getEnableNextButton) {
                              showConfirmForm();
                            }
                          },
                          child: Text(
                            'Proximo',
                            style: TextStyle(
                              color: exerciseFormProvider.getEnableNextButton
                                  ? Theme.of(context).colorScheme.primary
                                  : Colors.grey,
                            ),
                          ),
                        )
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
