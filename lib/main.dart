import 'package:flutter/material.dart';
import 'package:physioapp/controller/auth_controller.dart';
import 'package:physioapp/controller/user_fisio_controller.dart';
import 'package:physioapp/pages/auth_or_home_page.dart';
import 'package:physioapp/utils/app_routes.dart';
import 'package:provider/provider.dart';
import 'package:physioapp/pages/exercises_detail_page.dart';
import 'package:physioapp/pages/exercises_execution_page.dart';
import 'package:physioapp/pages/patient_detail_page.dart';
import 'package:physioapp/pages/account_page.dart';

void main() => runApp(const PhysioApp());

class PhysioApp extends StatelessWidget {
  const PhysioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthController(),
          child: const AuthOrHomePage(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthController(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthController(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserFisioController(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            centerTitle: true,
          ),
        ),
        routes: {
          AppRoutes.authOrHomePage: (context) => const AuthOrHomePage(),
          AppRoutes.exercisesDetail: (context) => const ExercisesDetailPage(),
          AppRoutes.exercisesExecution: (context) =>
              const ExercisesExecutionPage(),
          AppRoutes.patientDetail: (context) => const PatientDetailPage(),
          AppRoutes.accountPage: (context) => const AccountPage(),
        },
      ),
    );
  }
}
