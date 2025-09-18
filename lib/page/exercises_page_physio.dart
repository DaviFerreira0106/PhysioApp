import 'package:flutter/material.dart';

class ExercisesPagePhysio extends StatelessWidget {
  const ExercisesPagePhysio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercícios'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // GridView.builder(
            //   gridDelegate: gridDelegate,
            //   itemBuilder: itemBuilder,
            // ),
          ],
        ),
      ),
    );
  }
}
