import 'package:flutter/material.dart';
import 'package:physioapp/pages/auth_page.dart';
import 'package:physioapp/pages/home_page.dart';

class ControllerPage extends StatefulWidget {
  @override
  ControllerPageState createState() {
    return ControllerPageState();
  }
}

class ControllerPageState extends State<ControllerPage> {
  @override
  Widget build(BuildContext context) {
    return AuthPage();
  }
}