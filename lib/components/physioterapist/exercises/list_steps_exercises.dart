import 'package:flutter/material.dart';
import 'package:physioapp/services/exercises/exercises_controller_form.dart';
import 'package:provider/provider.dart';

class ListStepsExercises extends StatefulWidget {
  final String? initialValueKey;
  final String? initialValueDescription;
  const ListStepsExercises(
      {super.key,
      required this.initialValueKey,
      required this.initialValueDescription});

  @override
  State<ListStepsExercises> createState() => _ListStepsExercisesState();
}

class _ListStepsExercisesState extends State<ListStepsExercises> {
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

  @override
  Widget build(BuildContext context) {
    final exercisesFormProvider = Provider.of<ExercisesControllerForm>(context);
    print(widget.initialValueKey);
    return SizedBox(
      height: 180,
      child: Column(
        spacing: 10,
        children: [
          defaultTextForm(
            textForm: TextFormField(
              initialValue: widget.initialValueKey ?? '',
              decoration: InputDecoration(
                label: Text(
                  'Título da Etapa',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.labelLarge?.color,
                  ),
                ),
                border: InputBorder.none,
              ),
              onChanged: (titleStep) =>
                  exercisesFormProvider.titleStep = titleStep,
              keyboardType: TextInputType.text,
            ),
          ),
          defaultTextForm(
            textForm: TextFormField(
              initialValue: widget.initialValueDescription ?? '',
              decoration: InputDecoration(
                label: Text(
                  'Descrição da Etapa',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.labelLarge?.color,
                  ),
                ),
                border: InputBorder.none,
              ),
              onChanged: (descriptionStep) =>
                  exercisesFormProvider.descriptionStep = descriptionStep,
              keyboardType: TextInputType.text,
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }
}
