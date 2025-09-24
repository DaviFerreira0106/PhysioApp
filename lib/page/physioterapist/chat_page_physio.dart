import 'package:flutter/material.dart';
import 'package:physioapp/components/physioterapist/bottom_nav_bar.dart';

class ChatPagePhysio extends StatelessWidget {
  const ChatPagePhysio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              bottom: 24,
              child: BottomNavBar(),
            )
          ],
        ),
      ),
    );
  }
}
