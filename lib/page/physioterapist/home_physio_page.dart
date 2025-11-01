import 'package:flutter/material.dart';
import 'package:physioapp/components/physioterapist/navigation/app_drawer.dart';
import 'package:physioapp/components/physioterapist/home/consultation_calendar.dart';
import 'package:physioapp/components/physioterapist/home/search_patient.dart';
import 'package:physioapp/components/physioterapist/home/patient_appointment_list.dart';
import 'package:physioapp/services/auth/physio/auth_physio_service.dart';

class HomePhysioPage extends StatelessWidget {
  const HomePhysioPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    final physioUser = AuthPhysioService();

    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: SizedBox(
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
                            onTap: () {
                              _scaffoldKey.currentState?.openDrawer();
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.grey,
                              backgroundImage: FileImage(
                                physioUser.currentPhysioUser!.imageProfile,
                              ),
                              minRadius: 30,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Olá ${physioUser.currentPhysioUser!.firstName},',
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'O que vamos fazer hoje?',
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
      ),
      drawer: const AppDrawer(),
    );
  }
}
