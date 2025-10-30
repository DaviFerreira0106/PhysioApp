import 'dart:io';

import 'package:flutter/material.dart';
import 'package:physioapp/components/physioterapist/chat/list_patient.dart';
import 'package:physioapp/components/physioterapist/chat/search_patient.dart';
import 'package:physioapp/components/physioterapist/chat/select_patient_photo.dart';

class ChatPagePhysio extends StatelessWidget {
  const ChatPagePhysio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          child: Column(
            children: [
              const SearchPatient(),
              SelectPatientPhoto(
                imagePatient: File(
                    ''),
                patientCount: 15,
              ),
              ListPatient(
                namePatient:
                    'Davi ferreira da silva de oliveira cavalcante',
                message: 'Preview message',
                dateTime: DateTime.now(),
                messageQuantity: 2,
              ),
              ListPatient(
                namePatient:
                    'Davi ferreira da silva de oliveira cavalcante',
                message: 'Preview message',
                dateTime: DateTime.now(),
                messageQuantity: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
