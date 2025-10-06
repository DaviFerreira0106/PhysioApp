import 'package:flutter/material.dart';
import 'package:physioapp/components/physioterapist/consultation_calendar.dart';
import 'package:physioapp/components/physioterapist/search_patient.dart';
import 'package:physioapp/components/physioterapist/patient_appointment_list.dart';
import 'package:physioapp/components/physioterapist/bottom_nav_bar.dart';
import 'package:physioapp/main.dart';
import 'package:physioapp/model/auth/physio/auth.dart';
import 'package:physioapp/model/auth/physio/physio_user.dart';
import 'package:physioapp/utils/app_routes.dart';

class HomePhysioPage extends StatelessWidget {
  const HomePhysioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: GestureDetector(
                                onTap: () async {
                                  await Auth().logout();
                                  // ignore: use_build_context_synchronously
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      AppRoutes.initialAppPage, (_) => false);
                                },
                                child: const CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  minRadius: 30,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  '',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  'teste subtile',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.color,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.notifications_outlined,
                              color: Theme.of(context).primaryColor,
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SearchPatient(),
                  const ConsultationCalendar(),
                  const Expanded(
                    child: PatientAppointmentList(),
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
