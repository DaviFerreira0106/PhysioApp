import 'package:flutter/material.dart';
import 'package:physioapp/data/data_user_patient_mock.dart';
import 'package:physioapp/models/patient.dart';
import 'package:physioapp/components/patients.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Patient> userList = DataUserPatientMock.user;
    return ListView.builder(
      itemBuilder: (context, index) => Patients(
        patient: userList.elementAt(index),
      ),
      itemCount: userList.length,
    );
  }
}
