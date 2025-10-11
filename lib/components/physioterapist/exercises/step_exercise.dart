import 'package:flutter/material.dart';

class StepExercise extends StatelessWidget {
  const StepExercise({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Row(
        children: [
          Text('1'),
          Column(
            children: [
              Icon(Icons.blur_circular_rounded),
              Container(
                transform: Matrix4.rotationY(10),
                child: Icon(Icons.linear_scale_rounded),
              )
            ],
          )
        ],
      ),
    );
  }
}
