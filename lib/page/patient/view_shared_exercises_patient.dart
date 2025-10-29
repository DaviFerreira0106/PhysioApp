import 'package:flutter/material.dart';
import 'package:physioapp/components/patient/home/shared_exercise_item_patient.dart';

class ViewSharedExercisesPatient extends StatefulWidget {
  const ViewSharedExercisesPatient({super.key});

  @override
  State<ViewSharedExercisesPatient> createState() =>
      _ViewSharedExercisesPatientState();
}

class _ViewSharedExercisesPatientState
    extends State<ViewSharedExercisesPatient> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: Text('Ver todos'),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (context, index) {
                return SharedExerciseItemPatient();
              },
            ),
          ),
        ],
      ),
    );
  }
}
