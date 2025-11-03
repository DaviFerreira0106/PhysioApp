import 'package:flutter/material.dart';
import 'package:physioapp/components/physioterapist/profile/data_visualization_physio.dart';
import 'package:physioapp/components/physioterapist/profile/other_options_physio.dart';
import 'package:physioapp/components/physioterapist/profile/photo_profile_physio.dart';
import 'package:physioapp/components/physioterapist/profile/profile_data.dart';
import 'package:physioapp/services/auth/physio/auth_physio_service.dart';
import 'package:physioapp/services/profile/physio/physio_profile_service.dart';
import 'package:provider/provider.dart';

class PhysioProfilePage extends StatelessWidget {
  const PhysioProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final physioUser = AuthPhysioService();
    final profileProvider = Provider.of<PhysioProfileService>(context);

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
                              child: PhotoProfilePhysio(),
                            ),
                            Positioned(
                              right: 1,
                              child: DataVisualizationPhysio(),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        profileProvider.isVisible
                            ? physioUser.currentPhysioUser!.userName
                            : physioUser.currentPhysioUser!.obscureText(
                                physioUser.currentPhysioUser!.userName),
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        profileProvider.isVisible
                            ? physioUser.currentPhysioUser!.crefito
                            : physioUser.currentPhysioUser!.obscureText(
                                physioUser.currentPhysioUser!.crefito),
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Theme.of(context).textTheme.labelSmall?.color,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ProfileData(
                        physioUser: physioUser.currentPhysioUser!,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10.0),
                  margin: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 60,
                    bottom: 150,
                  ),
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
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Outros',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      OtherOptionsPhysio(),
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
