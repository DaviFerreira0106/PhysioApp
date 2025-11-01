import 'package:flutter/material.dart';
import 'package:physioapp/components/physioterapist/navigation/bottom_nav_bar_physio.dart';
import 'package:physioapp/page/physioterapist/chat_page_physio.dart';
import 'package:physioapp/page/physioterapist/exercises_page_physio.dart';
import 'package:physioapp/page/physioterapist/home_physio_page.dart';
import 'package:physioapp/page/physioterapist/physio_profile_page.dart';
import 'package:physioapp/page/physioterapist/schedule_appointment_page.dart';
import 'package:physioapp/services/navigation/bottom_nav_bar_controller.dart';
import 'package:provider/provider.dart';

class TabsPagePhysio extends StatefulWidget {
  const TabsPagePhysio({super.key});

  @override
  State<TabsPagePhysio> createState() => _TabsPagePhysioState();
}

class _TabsPagePhysioState extends State<TabsPagePhysio> {
  final List<Map<String, Object>> _indexScreen = [
    {
      'title': '',
      'screen': const HomePhysioPage(),
    },
    {
      'title': '',
      'screen': const ChatPagePhysio(),
    },
    {
      'title': '',
      'screen': const ExercisesPagePhysio(),
    },
    {
      'title': '',
      'screen': const PhysioProfilePage(),
    },
    {
      'title': '',
      'screen': const ScheduleAppointmentPage(),
    }
  ];

  @override
  Widget build(BuildContext context) {
    final indexProvider = Provider.of<BottomNavBarPhysioController>(context);
    return Scaffold(
      body: _indexScreen.elementAt(indexProvider.index)['screen'] as Widget,
      floatingActionButton: const BottomNavBarPhysio(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
