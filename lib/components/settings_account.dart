import 'package:flutter/material.dart';

class SettingsAccount extends StatefulWidget {
  const SettingsAccount({super.key});

  @override
  SettingsAccountState createState() {
    return SettingsAccountState();
  }
}

class SettingsAccountState extends State<SettingsAccount> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Container(
      height: 400,
      width: mediaQuery.width,
      decoration: const BoxDecoration(color: Color.fromARGB(22, 33, 149, 243)),
      child: Form(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: Color.fromARGB(26, 255, 193, 7),
              ),
              child: Center(
                child: Column(
                  children: [
                    const CircleAvatar(
                      minRadius: 50,
                      child: Center(
                        child: Icon(Icons.person, size: 50),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Atualizar Foto'),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
