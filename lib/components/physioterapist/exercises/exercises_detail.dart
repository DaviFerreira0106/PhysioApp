import 'package:flutter/material.dart';

class ExercisesDetail extends StatelessWidget {
  final String titleExercises;
  final String subtileExercises;
  const ExercisesDetail({
    super.key,
    required this.titleExercises,
    required this.subtileExercises,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 236, 236, 236),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(28),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: ListTile(
                title: Text(
                  titleExercises,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily:
                        Theme.of(context).textTheme.titleSmall?.fontFamily,
                    fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  subtileExercises,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.share_outlined),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
