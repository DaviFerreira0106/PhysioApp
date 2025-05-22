import 'package:flutter/material.dart';
import 'package:physioapp/pages/auth_page.dart';
import 'package:physioapp/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:physioapp/controller/auth_controller.dart';

class AuthOrHomePage extends StatefulWidget {
  const AuthOrHomePage({super.key});

  @override
  ControllerPageState createState() {
    return ControllerPageState();
  }
}

class ControllerPageState extends State<AuthOrHomePage> {
  @override
  Widget build(BuildContext context) {
    final AuthController auth = Provider.of(context);
    return auth.isAuth ? HomePage() : const AuthPage();
  }
}