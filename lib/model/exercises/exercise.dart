import 'package:flutter/material.dart';

class Exercise with ChangeNotifier {
  final String id;
  final String name;
  final String description;
  final String videoUrl;
  final List<Map<String, String>> steps;
  final int minute;
  final List<String> categoryId;
  bool isFavorite;

  Exercise({
    required this.id,
    required this.name,
    required this.description,
    required this.videoUrl,
    required this.minute,
    required this.steps,
    required this.categoryId,
    this.isFavorite = false,
  });

  void toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
