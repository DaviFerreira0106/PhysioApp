import 'package:flutter/material.dart';
import 'package:physioapp/models/exercises.dart';
import 'package:physioapp/controller/auth_controller.dart';
import 'package:provider/provider.dart';
import 'package:physioapp/pages/auth_or_home_page.dart';

class ExercisesExecutionPage extends StatelessWidget {
  const ExercisesExecutionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Exercises exercises =
        ModalRoute.of(context)?.settings.arguments as Exercises;
    final auth = Provider.of<AuthController>(context);
    return auth.isAuth
        ? Scaffold(
            appBar: AppBar(
              title: Text(exercises.name),
            ),
            body: Column(
              children: [
                SizedBox(
                  height: 300,
                  child: Image.network(exercises.imageUrl, fit: BoxFit.cover),
                ),
                Container(
                  decoration: const BoxDecoration(color: Colors.black54),
                  child: ListTile(
                    title: Text(
                      exercises.subtitle,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 300,
                  width: 350,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      style: BorderStyle.solid,
                      width: 1,
                    ),
                  ),
                  child: ListView.builder(
                    itemBuilder: (context, index) => Container(
                      height: 60,
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(2, 2),
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          exercises.steps.elementAt(index),
                        ),
                      ),
                    ),
                    itemCount: exercises.steps.length,
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.share),
            ),
          )
        : const AuthOrHomePage();
  }
}
