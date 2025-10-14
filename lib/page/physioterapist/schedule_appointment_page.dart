import 'package:flutter/material.dart';
import 'package:physioapp/components/physioterapist/bottom_nav_bar.dart';
import 'package:physioapp/components/physioterapist/schedule_appointment/first_form_schedule_appointment.dart';
import 'package:physioapp/components/physioterapist/schedule_appointment/select_form.dart';

class ScheduleAppointmentPage extends StatelessWidget {
  const ScheduleAppointmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Agendamento de Consulta'),
        ),
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      right: 8.0,
                      bottom: 50.0,
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
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Column(
                      
                      children: [
                        
                        FirstFormScheduleAppointment(),
                        SelectForm(),
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
