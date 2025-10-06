import 'package:flutter/material.dart';
import 'package:physioapp/components/physioterapist/bottom_nav_bar.dart';
import 'package:physioapp/components/physioterapist/profile/photo_profile.dart';
import 'package:physioapp/components/physioterapist/profile/profile_data.dart';

class PhysioProfilePage extends StatelessWidget {
  const PhysioProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SingleChildScrollView(
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
                          child: Stack(
                            children: [
                              const Center(
                                child: PhotoProfile(),
                              ),
                              Positioned(
                                right: 1,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.visibility_sharp,
                                    color: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.color,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'Nome de Usuário Fisioterapeuta',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Número Crefito',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).textTheme.labelSmall?.color,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const ProfileData(),
                      ],
                    ),
                  ),
                ],
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
