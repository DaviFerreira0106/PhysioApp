import 'package:flutter/material.dart';
import 'package:physioapp/page/patient/add_physio_page.dart';
import 'package:physioapp/page/patient/tabs_page_patient.dart';
import 'package:physioapp/page/physioterapist/add_exercise_page.dart';
import 'package:physioapp/page/physioterapist/add_patient_page.dart';
import 'package:physioapp/page/physioterapist/exercises_page_physio.dart';
import 'package:physioapp/page/physioterapist/policy_privacy_page.dart';
import 'package:physioapp/page/physioterapist/tabs_page_physio.dart';
import 'package:physioapp/services/auth/auth_form.dart';
import 'package:physioapp/services/exercises/physio/exercise_controller.dart';
import 'package:physioapp/services/exercises/physio/exercises_controller_form.dart';
import 'package:physioapp/services/exercises/physio/exercises_controller_component.dart';
import 'package:physioapp/services/navigation/bottom_nav_bar_controller.dart';
import 'package:physioapp/services/navigation/bottom_nav_bar_patient_controller.dart';
import 'package:physioapp/services/profile/patient/patient_profile_service.dart';
import 'package:physioapp/services/profile/physio/physio_profile_service.dart';
import 'package:physioapp/services/schedule/schedule_appointment_controller.dart';
import 'package:physioapp/services/schedule/schedule_appointment_form.dart';
import 'package:physioapp/page/patient/signin_patient_page.dart';
import 'package:physioapp/page/patient/signup_patient_page.dart';
import 'package:physioapp/page/physioterapist/exercises_detail_page.dart';
import 'package:physioapp/page/physioterapist/exercises_list_page.dart';
import 'package:physioapp/page/physioterapist/message_page.dart';
import 'package:physioapp/utils/app_routes.dart';
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
          create: (context) => AuthFormData(),
        ),
        ChangeNotifierProvider(
          create: (context) => ExercisesControllerComponent(),
        ),
        ChangeNotifierProvider(
          create: (context) => BottomNavBarPhysioController(),
        ),
        ChangeNotifierProvider(
          create: (context) => BottomNavBarPatientController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ScheduleAppointmentForm(),
        ),
        ChangeNotifierProvider(
          create: (context) => ExerciseController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ExercisesControllerForm(),
        ),
        ChangeNotifierProvider(
          create: (context) => ScheduleAppointmentController(),
        ),
        ChangeNotifierProvider(
          create: (context) => PhysioProfileService(),
        ),
        ChangeNotifierProvider(
          create: (context) => PatientProfileService(),
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
          AppRoutes.authPhysioPage: (context) => const AuthPhysioPage(),
          AppRoutes.authPatientPage: (context) => const AuthPatientPage(),
          AppRoutes.signInPhysioPage: (context) => const SigninPhysioPage(),
          AppRoutes.signUpPhysioPage: (context) => const SignupPhysioPage(),
          AppRoutes.signInPatientPage: (context) => const SigninPatientPage(),
          AppRoutes.signUpPatientPage: (context) => const SignupPatientPage(),
          AppRoutes.messagePage: (context) => const MessagePage(),
          AppRoutes.exercisesListPage: (context) => const ExercisesListPage(),
          AppRoutes.exercisesDetailPage: (context) =>
              const ExercisesDetailPage(),
          AppRoutes.addExercisePage: (context) => const AddExercisePage(),
          AppRoutes.tabPagePatient: (context) => const TabsPagePatient(),
          AppRoutes.addPatientPage: (context) => const AddPatientPage(),
          AppRoutes.addPhysioPage: (context) => const AddPhysioPage(),
          AppRoutes.tabPagePhysio: (context) => const TabsPagePhysio(),
          AppRoutes.exercisesPagePhysio: (context) =>
              const ExercisesPagePhysio(),
          AppRoutes.policyPrivacyPage: (context) => const PolicyPrivacyPage(),
        },
      ),
    );
  }
}
