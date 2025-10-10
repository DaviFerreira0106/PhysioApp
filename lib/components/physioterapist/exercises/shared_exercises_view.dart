import 'package:flutter/material.dart';

class SharedExercisesView extends StatefulWidget {
  const SharedExercisesView({super.key});

  @override
  State<SharedExercisesView> createState() => _SharedExercisesViewState();
}

class _SharedExercisesViewState extends State<SharedExercisesView> {
  @override
  Widget build(BuildContext context) {
    List<Widget> listExercises = [
      // Container(
      //   height: 100,
      //   width: 100,
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(10),
      //     color: Colors.blue,
      //     border: Border.all(color: Colors.black),
      //   ),
      // ),
      // Container(
      //   height: 100,
      //   width: 100,
      //   margin: const EdgeInsets.only(),
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(10),
      //     color: Colors.blue,
      //     border: Border.all(color: Colors.black),
      //   ),
      // ),
    ];

    double listCount = listExercises.length.toDouble();
    double marginContainer = (100 * listCount) * 0.3;

    listExercises.addAll(
      [
        Container(
          height: 100,
          width: 100,
          margin: EdgeInsets.only(left: marginContainer),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue,
            border: Border.all(color: Colors.black),
          ),
        ),
        Container(
          height: 100,
          width: 100,
          margin: EdgeInsets.only(left: marginContainer),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue,
            border: Border.all(color: Colors.black),
          ),
        ),
      ],
    );

    listExercises.add(
      Container(
        height: 100,
        width: 100,
        margin: EdgeInsets.only(left: marginContainer),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue,
          border: Border.all(color: Colors.black),
        ),
      ),
    );
    return Container(
      height: 176,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.amber,
        // gradient: LinearGradient(
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        //   colors: [
        //     Color.fromARGB(255, 223, 224, 234),
        //     Color.fromARGB(255, 233, 235, 240),
        //   ],
        // ),
        borderRadius: BorderRadius.circular(28),
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      child: Column(
        children: [
          Text('Exercícios compartilhados'),
          Container(
            height: 100,
            color: Colors.black38,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Stack(
                  children: listExercises.reversed.toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
