import 'package:flutter/material.dart';
import 'package:physioapp/components/physioterapist/exercises/add_video_box.dart';

class SecondAddExerciseForm extends StatefulWidget {
  const SecondAddExerciseForm({super.key});

  @override
  State<SecondAddExerciseForm> createState() => _SecondAddExerciseFormState();
}

class _SecondAddExerciseFormState extends State<SecondAddExerciseForm> {
  @override
  Widget build(BuildContext context) {
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
          TextButton.icon(
            onPressed: () {},
            label: Text('Selecionar Vídeo'),
            icon: Icon(Icons.upload_rounded),
          ),
          defaultTextForm(
            textForm: TextFormField(
              decoration: InputDecoration(
                label: Text(
                  'Duração do Vídeo',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.labelLarge?.color,
                  ),
                ),
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.number,
            ),
          ),
        ],
      ),
    );
  }
}
