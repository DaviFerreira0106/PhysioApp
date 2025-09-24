import 'package:flutter/material.dart';

class PhysioOrPatientPage extends StatefulWidget {
  const PhysioOrPatientPage({super.key});

  @override
  PhysioOrPatientPageState createState() => PhysioOrPatientPageState();
}

class PhysioOrPatientPageState extends State<PhysioOrPatientPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).colorScheme.primary,
              const Color.fromARGB(127, 255, 255, 255),
              const Color.fromARGB(127, 255, 255, 255),
            ],
          ),
        ),
      ),
    );
  }
}
