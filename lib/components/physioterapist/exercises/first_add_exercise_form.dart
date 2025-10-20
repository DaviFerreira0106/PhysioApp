import 'package:flutter/material.dart';
import 'package:physioapp/services/exercises/exercises_controller_form.dart';
import 'package:provider/provider.dart';

class FirstAddExerciseForm extends StatefulWidget {
  const FirstAddExerciseForm({super.key});

  @override
  State<FirstAddExerciseForm> createState() => _FirstAddExerciseFormState();
}

class _FirstAddExerciseFormState extends State<FirstAddExerciseForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final exerciseProvider = Provider.of<ExercisesControllerForm>(context);

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
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Text(
            'Informações do Exercício',
            style: TextStyle(
              color: Theme.of(context).textTheme.labelLarge?.color,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 6),
          defaultTextForm(
            textForm: TextFormField(
              decoration: InputDecoration(
                label: Text(
                  'Título do exercício',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.labelLarge?.color,
                  ),
                ),
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.text,
            ),
          ),
          defaultTextForm(
            textForm: TextFormField(
              decoration: InputDecoration(
                label: Text(
                  'Descrição do exercício',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.labelLarge?.color,
                  ),
                ),
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.text,
              maxLines: 3,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 6, bottom: 6),
            child: Text(
              'Etapas do Exercício',
              style: TextStyle(
                color: Theme.of(context).textTheme.labelLarge?.color,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          defaultTextForm(
            textForm: TextFormField(
              decoration: InputDecoration(
                label: Text(
                  'Título da Etapa',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.labelLarge?.color,
                  ),
                ),
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.text,
            ),
          ),
          defaultTextForm(
            textForm: TextFormField(
              decoration: InputDecoration(
                label: Text(
                  'Descrição da Etapa',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.labelLarge?.color,
                  ),
                ),
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.text,
              maxLines: 3,
            ),
          ),
          Column(
            spacing: 10,
            children: exerciseProvider.stepsExercises,
          ),
          Container(
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
                exerciseProvider.addStep(
                  titleTextForm: defaultTextForm(
                    textForm: TextFormField(
                      decoration: InputDecoration(
                        label: Text(
                          'Título da Etapa',
                          style: TextStyle(
                            color:
                                Theme.of(context).textTheme.labelLarge?.color,
                          ),
                        ),
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  descriptionTextForm: defaultTextForm(
                    textForm: TextFormField(
                      decoration: InputDecoration(
                        label: Text(
                          'Descrição da Etapa',
                          style: TextStyle(
                            color:
                                Theme.of(context).textTheme.labelLarge?.color,
                          ),
                        ),
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.text,
                      maxLines: 3,
                    ),
                  ),
                );
              },
              child: const Text(
                'Adicionar Etapa',
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
