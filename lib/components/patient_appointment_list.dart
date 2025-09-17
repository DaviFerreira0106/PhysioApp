import 'package:flutter/material.dart';

class PatientAppointmentList extends StatelessWidget {
  const PatientAppointmentList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) => Container(
        width: double.infinity,
        height: 150,
        margin: const EdgeInsets.only(right: 20, left: 20, top: 20),
        padding: const EdgeInsets.only(right: 30, left: 30, top: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nome do Paciente',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    Text('Sintomas do Paciente'),
                  ],
                ),
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  minRadius: 30,
                ),
              ],
            ),
            Row(
              children: [],
            )
          ],
        ),
      ),
    );
  }
}
