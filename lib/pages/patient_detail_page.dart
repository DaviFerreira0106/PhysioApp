import 'package:flutter/material.dart';
import 'package:physioapp/models/patient.dart';

class PatientDetailPage extends StatelessWidget {
  const PatientDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Patient patient =
        ModalRoute.of(context)?.settings.arguments as Patient;
    final double mediaQuery = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário do Paciente'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: const Center(
              child: CircleAvatar(
                minRadius: 50,
                child: Icon(
                  Icons.person,
                  size: 50,
                ),
              ),
            ),
          ),
          Container(
            height: 300,
            width: mediaQuery,
            margin: const EdgeInsets.all(8),
            child: Column(
              children: [
                Container(
                  height: 50,
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      style: BorderStyle.solid,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: const Text(
                      'Nome:',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    title: Text(
                      patient.name,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      style: BorderStyle.solid,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: const Text(
                      'E-mail:',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    title: Text(
                      patient.semiAnonimiEmail,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      style: BorderStyle.solid,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: const Text(
                      'Cpf:',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    title: Text(
                      patient.semiAnonimiCpf,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
