import 'package:flutter/material.dart';

class AddPatientPage extends StatelessWidget {
  const AddPatientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Paciente'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Adicione Pacientes',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Text(
                'Compartilhe seu QR-Code com seus pacientes e\ncomece a automatizar seu atendimento'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: const EdgeInsets.all(20.0),
                  margin: const EdgeInsets.only(right: 20, left: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(255, 223, 224, 234),
                        Color.fromARGB(255, 233, 235, 240),
                      ],
                    ),
                  ),
                  child: Text('QR-Code')),
            ],
          ),
        ],
      ),
    );
  }
}
