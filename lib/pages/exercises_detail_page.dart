import 'package:flutter/material.dart';
import 'package:physioapp/data/data_mock.dart';
import 'package:physioapp/models/category.dart';
import 'package:physioapp/models/exercises.dart';
import 'package:physioapp/components/exercises_detail.dart';
import 'package:physioapp/controller/auth_controller.dart';
import 'package:provider/provider.dart';
import 'package:physioapp/pages/auth_or_home_page.dart';

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
    final auth = Provider.of<AuthController>(context);
    return auth.isAuth
        ? Scaffold(
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
                itemCount: exercises.length,
              ),
            ),
          )
        : const AuthOrHomePage();
  }
}
