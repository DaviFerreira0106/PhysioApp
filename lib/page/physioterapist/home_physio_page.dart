import 'package:flutter/material.dart';
import 'package:physioapp/components/physioterapist/consultation_calendar.dart';
import 'package:physioapp/components/physioterapist/search_patient.dart';
import 'package:physioapp/components/physioterapist/patient_appointment_list.dart';
import 'package:physioapp/components/physioterapist/bottom_nav_bar.dart';

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
                              child: CircleAvatar(
                                backgroundColor: Colors.grey,
                                minRadius: 30,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Teste',
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
                  SearchPatient(),
                  ConsultationCalendar(),
                  Expanded(
                    child: PatientAppointmentList(),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 24,
              child: BottomNavBar(),
            ),
          ],
        ),
      ),
    );
  }
}
