import 'package:flutter/material.dart';
import 'package:physioapp/components/patient/profile/profile_data_patient.dart';
import 'package:physioapp/components/physioterapist/profile/%20data_visualization.dart';
import 'package:physioapp/components/photo_profile.dart';
import 'package:physioapp/services/auth/patient/auth_patient_service.dart';
import 'package:physioapp/services/profile/patient/patient_profile_service.dart';
import 'package:provider/provider.dart';

class PatientProfilePage extends StatelessWidget {
  const PatientProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final patientUser = AuthPatientService();
    final profileProvider = Provider.of<PatientProfileService>(context);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24.0),
                  margin: const EdgeInsets.only(left: 20, right: 20, top: 60),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(255, 223, 224, 234),
                        Color.fromARGB(255, 233, 235, 240),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(26),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: const Stack(
                          children: [
                            Center(
                              child: PhotoProfile(),
                            ),
                            Positioned(
                              right: 1,
                              child: DataVisualization(),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        profileProvider.isVisible
                            ? patientUser.currentPatientUser!.userName
                            : patientUser.currentPatientUser!.obscureText(
                                patientUser.currentPatientUser!.userName),
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ProfileDataPatient(
                        patientUser: patientUser.currentPatientUser!,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
