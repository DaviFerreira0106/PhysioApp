import 'package:flutter/material.dart';
import 'package:physioapp/models/exercises.dart';

class ExercisesDetail extends StatelessWidget {
  final Exercises exercises;
  const ExercisesDetail({
    super.key,
    required this.exercises,
  });

  @override
  Widget build(BuildContext context) {
    final mediaSizeWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15),
              topLeft: Radius.circular(15),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(5, 0),
                blurRadius: 15,
              ),
            ],
          ),
          width: mediaSizeWidth,
          height: 200,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15),
              topLeft: Radius.circular(15),
            ),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image.network(
                  width: mediaSizeWidth,
                  exercises.imageUrl,
                  fit: BoxFit.cover,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.only(bottom: 8),
                  decoration: const BoxDecoration(color: Colors.black54),
                  child: Text(
                    exercises.name,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(5, 5),
                  blurRadius: 15,
                ),
              ]),
          width: mediaSizeWidth,
          height: 50,
          child: ListTile(
            leading: const Text(
              'Dificuldade:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            title: Text(
              exercises.getComplexity,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        )
      ],
    );
  }
}
