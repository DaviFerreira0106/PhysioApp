import 'package:flutter/material.dart';
import 'package:physioapp/components/patient/bottom_nav_bar_patient.dart';
import 'package:physioapp/page/patient/chat_patient_page.dart';
import 'package:physioapp/page/patient/home_patient_page.dart';
import 'package:physioapp/services/navigation/bottom_nav_bar_patient_controller.dart';
import 'package:provider/provider.dart';

class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  final _indexScreen = [
    {
      'title': '',
      'screen': HomePatientPage(),
    },
    {
      'title': '',
      'screen': ChatPatientPage(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    final indexProvider = Provider.of<BottomNavBarPatientController>(context);
    return Scaffold(
      body: _indexScreen.elementAt(indexProvider.index)['screen'] as Widget,
      floatingActionButton: const BottomNavBarPatient(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
