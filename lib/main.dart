import 'package:flutter/material.dart';
import 'package:physioapp/pages/auth_page.dart';
import 'package:physioapp/utils/app_routes.dart';

void main() => runApp(PhysioApp());

class PhysioApp extends StatelessWidget {
  const PhysioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AuthPage(),
      routes: {
        AppRoutes.authpage: (context) => AuthPage(),
      }
    );
  }
}