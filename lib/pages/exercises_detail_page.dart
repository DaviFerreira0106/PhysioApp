import 'package:flutter/material.dart';
import 'package:physioapp/data/data_mock.dart';
import 'package:physioapp/models/category.dart';
import 'package:physioapp/models/exercises.dart';
import 'package:physioapp/components/exercises_detail.dart';

class ExercisesDetailPage extends StatelessWidget {
  const ExercisesDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Category category =
        ModalRoute.of(context)?.settings.arguments as Category;
    const List<Exercises> exercisesList = DataMock.exercisesDataList;
    final List<Exercises> exercises = exercisesList
        .where((exercise) => exercise.categories.contains(category.id))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: ExercisesDetail(
              exercises: exercises.elementAt(index),
            ),
          ),
          // Container(
          //   height: 300,
          //   width: mediaSizeWidth,
          //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          //   child: Stack(
          //     alignment: Alignment.bottomLeft,
          //     children: [
          //       ClipRRect(
          //         borderRadius: BorderRadius.circular(15),
          //         child: Image.network(
          //           exercises.elementAt(index).imageUrl,
          //           fit: BoxFit.cover,
          //         ),
          //       ),
          //       Container(
          //         padding: const EdgeInsets.all(8),
          //         decoration: const BoxDecoration(
          //           color: Colors.black54,
          //           borderRadius: BorderRadius.only(
          //             topRight: Radius.circular(10),
          //             bottomRight: Radius.circular(10),
          //           ),
          //         ),
          //         child: Text(
          //           exercises.elementAt(index).subtitle,
          //           style: const TextStyle(
          //             color: Colors.white,
          //             fontWeight: FontWeight.bold,
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          itemCount: exercises.length,
        ),
      ),
    );
  }
}
