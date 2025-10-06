import 'package:flutter/material.dart';
import 'package:physioapp/components/physioterapist/bottom_nav_bar.dart';
import 'package:physioapp/components/physioterapist/chat/list_patient.dart';

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
          child: Stack(
            children: [
              Column(
                children: [
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
              Positioned(
                bottom: 24,
                child: BottomNavBar(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
