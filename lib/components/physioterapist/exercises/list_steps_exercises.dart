import 'package:flutter/material.dart';
import 'package:physioapp/services/exercises/exercises_form_data.dart';
import 'package:provider/provider.dart';

class ListStepsExercises extends StatefulWidget {
  const ListStepsExercises({super.key});

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
    final exercisesFormData = Provider.of<ExercisesFormData>(context);
    return Flexible(
      child: Column(
        children: [
          defaultTextForm(
            textForm: TextFormField(
              initialValue: ExercisesFormData().listKeys.isNotEmpty
                  ? exercisesFormData.getKeyList()
                  : '',
              decoration: InputDecoration(
                label: Text(
                  'Título da Etapa',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.labelLarge?.color,
                  ),
                ),
                border: InputBorder.none,
              ),
              onChanged: (titleStep) => exercisesFormData.titleStep = titleStep,
              keyboardType: TextInputType.text,
            ),
          ),
          defaultTextForm(
            textForm: TextFormField(
              // initialValue:,
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
                  exercisesFormData.descriptionStep = descriptionStep,
              keyboardType: TextInputType.text,
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }
}
