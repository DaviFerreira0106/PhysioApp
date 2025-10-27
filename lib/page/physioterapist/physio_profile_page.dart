import 'package:flutter/material.dart';
import 'package:physioapp/components/physioterapist/bottom_nav_bar.dart';
import 'package:physioapp/components/physioterapist/profile/%20data_visualization.dart';
import 'package:physioapp/components/physioterapist/profile/photo_profile.dart';
import 'package:physioapp/components/physioterapist/profile/profile_data.dart';
import 'package:physioapp/services/auth/physio/auth_physio_service.dart';

class PhysioProfilePage extends StatelessWidget {
  const PhysioProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final physioUser = AuthPhysioService();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(24.0),
                      margin:
                          const EdgeInsets.only(left: 20, right: 20, top: 60),
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
                            physioUser.currentPhysioUser!.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            physioUser.currentPhysioUser!.crefito,
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color:
                                  Theme.of(context).textTheme.labelSmall?.color,
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
                  ],
                ),
              ),
            ),
            const Positioned(
              bottom: 24,
              child: BottomNavBar(),
            ),
          ],
        ),
      ),
    );
  }
}
