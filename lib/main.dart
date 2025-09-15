import 'package:flutter/material.dart';
import 'package:physioapp/page/home_page.dart';

void main() => runApp(const PhysioApp());

class PhysioApp extends StatelessWidget {
  @override
  const PhysioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 221, 224, 228),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 221, 224, 228),
          centerTitle: true,
        ),
        colorScheme: const ColorScheme.light(
          primary: Color.fromARGB(255, 56, 163, 165),
          secondary: Color.fromARGB(255, 255, 29, 145),
          tertiary: Color.fromARGB(255, 255, 168, 117),
          primaryContainer: Color.fromARGB(255, 236, 236, 236),
        ),
        primaryTextTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Color.fromARGB(255, 20, 24, 27),
          ),
          displayMedium: TextStyle(
            color: Color.fromARGB(255, 20, 24, 27),
          ),
          displaySmall: TextStyle(
            color: Color.fromARGB(255, 20, 24, 27),
          ),
          headlineLarge: TextStyle(
            color: Color.fromARGB(255, 20, 24, 27),
          ),
          headlineMedium: TextStyle(
            color: Color.fromARGB(255, 20, 24, 27),
          ),
          headlineSmall: TextStyle(
            color: Color.fromARGB(255, 20, 24, 27),
          ),
          titleLarge: TextStyle(
            color: Color.fromARGB(255, 20, 24, 27),
          ),
          titleMedium: TextStyle(
            color: Colors.white,
          ),
          titleSmall: TextStyle(
            color: Colors.white,
          ),
          labelLarge: TextStyle(
            color: Color.fromARGB(255, 110, 125, 162),
          ),
          labelMedium: TextStyle(
            color: Color.fromARGB(255, 110, 125, 162),
          ),
          labelSmall: TextStyle(
            color: Color.fromARGB(255, 110, 125, 162),
          ),
          bodyLarge: TextStyle(
            color: Color.fromARGB(255, 20, 24, 27),
          ),
          bodyMedium: TextStyle(
            color: Color.fromARGB(255, 20, 24, 27),
          ),
          bodySmall: TextStyle(
            color: Color.fromARGB(255, 20, 24, 27),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
