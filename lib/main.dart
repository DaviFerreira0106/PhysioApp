import 'package:flutter/material.dart';
import 'package:physioapp/model/auth/physio/auth_form.dart';
import 'package:physioapp/model/exercises/phtysio/exercises_controller_component.dart';
import 'package:physioapp/page/patient/signin_patient_page.dart';
import 'package:physioapp/page/patient/signup_patient_page.dart';
import 'package:physioapp/page/physioterapist/home_physio_page.dart';
import 'package:physioapp/page/physioterapist/message_page.dart';
import 'package:physioapp/utils/app_routes.dart';
import 'package:physioapp/page/physioterapist/exercises_page_physio.dart';
import 'package:physioapp/page/physioterapist/chat_page_physio.dart';
import 'package:physioapp/page/physioterapist/physio_profile_page.dart';
import 'package:physioapp/page/physioterapist/schedule_appointment_page.dart';
import 'package:physioapp/page/physio_or_patient_page.dart';
import 'package:physioapp/page/physioterapist/auth_physio_page.dart';
import 'package:physioapp/page/patient/auth_patient_page.dart';
import 'package:physioapp/page/physioterapist/signin_physio_page.dart';
import 'package:physioapp/page/physioterapist/signup_physio_page.dart';
import 'package:physioapp/utils/signup_page_form.dart';
import 'package:provider/provider.dart';

void main() => runApp(const PhysioApp());

class PhysioApp extends StatelessWidget {
  @override
  const PhysioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SignUpPageForm(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthForm(),
        ),
        ChangeNotifierProvider(
          create: (context) => ExercisesControllerComponent(),
        ),
      ],
      child: MaterialApp(
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
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              fontFamily: "Outfit",
              fontSize: 64,
              color: Color.fromARGB(255, 20, 24, 27),
            ),
            displayMedium: TextStyle(
              fontFamily: "Outfit",
              fontSize: 44,
              color: Color.fromARGB(255, 20, 24, 27),
            ),
            displaySmall: TextStyle(
              fontFamily: "Outfit",
              fontSize: 36,
              color: Color.fromARGB(255, 20, 24, 27),
            ),
            headlineLarge: TextStyle(
              fontFamily: "Outfit",
              fontSize: 32,
              color: Color.fromARGB(255, 20, 24, 27),
            ),
            headlineMedium: TextStyle(
              fontFamily: "Outfit",
              fontSize: 24,
              color: Color.fromARGB(255, 20, 24, 27),
            ),
            headlineSmall: TextStyle(
              fontFamily: "Outfit",
              fontSize: 24,
              color: Color.fromARGB(255, 20, 24, 27),
            ),
            titleLarge: TextStyle(
              fontFamily: "Outfit",
              fontSize: 22,
              color: Color.fromARGB(255, 20, 24, 27),
            ),
            titleMedium: TextStyle(
              fontFamily: "Poppins",
              fontSize: 18,
              color: Colors.white,
            ),
            titleSmall: TextStyle(
              fontFamily: "Poppins",
              fontSize: 16,
              color: Colors.white,
            ),
            labelLarge: TextStyle(
              fontFamily: "Poppins",
              fontSize: 16,
              color: Color.fromARGB(255, 110, 125, 162),
            ),
            labelMedium: TextStyle(
              fontFamily: "Poppins",
              fontSize: 14,
              color: Color.fromARGB(255, 110, 125, 162),
            ),
            labelSmall: TextStyle(
              fontFamily: "Poppins",
              fontSize: 12,
              color: Color.fromARGB(255, 110, 125, 162),
            ),
            bodyLarge: TextStyle(
              fontFamily: "Poppins",
              fontSize: 16,
              color: Color.fromARGB(255, 20, 24, 27),
            ),
            bodyMedium: TextStyle(
              fontFamily: "Poppins",
              fontSize: 14,
              color: Color.fromARGB(255, 20, 24, 27),
            ),
            bodySmall: TextStyle(
              fontFamily: "Poppins",
              fontSize: 12,
              color: Color.fromARGB(255, 20, 24, 27),
            ),
          ),
        ),
        home: const PhysioOrPatientPage(),
        initialRoute: AppRoutes.initialAppPage,
        routes: {
          AppRoutes.homePagePhysio: (context) => const HomePhysioPage(),
          AppRoutes.exercisesPagePhysio: (context) =>
              const ExercisesPagePhysio(),
          AppRoutes.chatPagePhysio: (context) => const ChatPagePhysio(),
          AppRoutes.physioProfilePage: (context) => const PhysioProfilePage(),
          AppRoutes.scheduleAppointmentPage: (context) =>
              const ScheduleAppointmentPage(),
          AppRoutes.authPhysioPage: (context) => const AuthPhysioPage(),
          AppRoutes.authPatientPage: (context) => const AuthPatientPage(),
          AppRoutes.signInPhysioPage: (context) => const SigninPhysioPage(),
          AppRoutes.signUpPhysioPage: (context) => const SignupPhysioPage(),
          AppRoutes.signInPatientPage: (context) => const SigninPatientPage(),
          AppRoutes.signUpPatientPage: (context) => const SignupPatientPage(),
          AppRoutes.messagePage: (context) => const MessagePage(),
        },
      ),
    );
  }
}
