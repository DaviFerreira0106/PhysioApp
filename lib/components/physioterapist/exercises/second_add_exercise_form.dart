import 'package:flutter/material.dart';
import 'package:physioapp/components/physioterapist/exercises/add_video_box.dart';
import 'package:physioapp/components/physioterapist/exercises/time_input_formatter.dart';
import 'package:physioapp/exception/auth_signup_exception.dart';
import 'package:physioapp/services/exercises/exercise_controller.dart';
import 'package:physioapp/services/exercises/exercises_controller_form.dart';
import 'package:physioapp/utils/app_routes.dart';
import 'package:provider/provider.dart';

class SecondAddExerciseForm extends StatefulWidget {
  const SecondAddExerciseForm({super.key});

  @override
  State<SecondAddExerciseForm> createState() => _SecondAddExerciseFormState();
}

class _SecondAddExerciseFormState extends State<SecondAddExerciseForm> {
  Future<void> _submitFormAddExercise({
    required ExercisesControllerForm formExercise,
  }) async {
    final authException = AuthSignupException();
    final exerciseController =
        Provider.of<ExerciseController>(context, listen: false);

    if (formExercise.durationVideo == null) {
      return authException.showErrorValidate(
        message: 'Digite o tempo de duração do vídeo',
        context: context,
      );
    }
    Navigator.of(context).pushNamedAndRemoveUntil(
      AppRoutes.exercisesPagePhysio,
      (_) => false,
    );
    formExercise.toggleForm(valueForm: formExercise.getFirstForm);
    exerciseController.addExercises(formExercise: formExercise);
    formExercise.resetSteps();
  }

  @override
  Widget build(BuildContext context) {
    final exercisesControllerProvider =
        Provider.of<ExercisesControllerForm>(context);

    Widget defaultTextForm({required Widget textForm}) {
      return Container(
        padding: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: textForm,
      );
    }

    return Form(
      child: Column(
        spacing: 10,
        children: [
          Text(
            'Informações do Exercício',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).textTheme.labelLarge?.color,
            ),
          ),
          const AddVideoBox(),
          defaultTextForm(
            textForm: TextFormField(
              decoration: InputDecoration(
                label: Text(
                  'Duração do Vídeo',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.labelLarge?.color,
                  ),
                ),
                hintText: '00:00',
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                TimeInputFormatter(),
              ],
              onChanged: (videoDuration) =>
                  exercisesControllerProvider.durationVideo =
                      double.parse(videoDuration.replaceAll(':', '.')),
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            margin: const EdgeInsets.only(top: 10),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  Theme.of(context).colorScheme.tertiary,
                ),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              onPressed: () {
                _submitFormAddExercise(
                    formExercise: exercisesControllerProvider);
              },
              child: const Text(
                'Adicionar Exercício',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
