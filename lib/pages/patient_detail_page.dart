import 'package:flutter/material.dart';
import 'package:physioapp/models/patient.dart';

class PatientDetailPage extends StatelessWidget {
  const PatientDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Patient patient =
        ModalRoute.of(context)?.settings.arguments as Patient;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário do Paciente'),
      ),
      body: Column(
        children: [
          Text('Nome: ${patient.name}'),
          Text('E-mail: ${patient.email}'),
          Text('Cpf: ${patient.cpf}')
        ],
      ),
    );
  }
}
