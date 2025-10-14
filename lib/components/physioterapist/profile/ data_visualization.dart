import 'package:flutter/material.dart';

class DataVisualization extends StatefulWidget {
  const DataVisualization({super.key});

  @override
  State<DataVisualization> createState() => _DataVisualizationState();
}

class _DataVisualizationState extends State<DataVisualization> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        Icons.visibility_sharp,
        color: Theme.of(context).textTheme.labelSmall?.color,
      ),
    );
  }
}
