import 'package:flutter/material.dart';

class PreviewMap extends StatefulWidget {
  const PreviewMap({super.key});

  @override
  State<PreviewMap> createState() => _PreviewMapState();
}

class _PreviewMapState extends State<PreviewMap> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(color: Colors.amber),
        ),
        TextButton.icon(
          onPressed: () {},
          label: Text('Procurar no Mapa'),
          icon: Icon(Icons.map_rounded),
        ),
      ],
    );
  }
}
