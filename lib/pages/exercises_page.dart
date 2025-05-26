import 'package:flutter/material.dart';
import 'package:physioapp/data/data_mock.dart';
import 'package:physioapp/models/category.dart';
import 'package:physioapp/utils/app_routes.dart';

class ExercisesPage extends StatelessWidget {
  const ExercisesPage({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Category> categoryList = DataMock.categoryDataList;

    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(
          AppRoutes.exercisesDetail,
          arguments: categoryList.elementAt(index),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: categoryList.elementAt(index).color,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(3, 3),
              )
            ],
          ),
          padding: const EdgeInsets.all(5),
          child: Center(
            child: Text(
              categoryList.elementAt(index).title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      itemCount: categoryList.length,
    );
  }
}
