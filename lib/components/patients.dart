import 'package:flutter/material.dart';
import 'package:physioapp/models/patient.dart';
import 'package:physioapp/utils/app_routes.dart';

class Patients extends StatelessWidget {
  final Patient patient;
  const Patients({
    super.key,
    required this.patient,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(
        AppRoutes.patientDetail,
        arguments: patient,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 5,
          right: 5,
        ),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: Text(
                patient.name,
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
