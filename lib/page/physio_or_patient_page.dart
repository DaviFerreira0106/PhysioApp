import 'package:flutter/material.dart';
import 'package:physioapp/utils/app_routes.dart';

class PhysioOrPatientPage extends StatefulWidget {
  const PhysioOrPatientPage({super.key});

  @override
  PhysioOrPatientPageState createState() => PhysioOrPatientPageState();
}

class PhysioOrPatientPageState extends State<PhysioOrPatientPage> {
  bool _optionProfilePhysio = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).colorScheme.primary,
              const Color.fromARGB(127, 255, 255, 255),
              const Color.fromARGB(127, 255, 255, 255),
            ],
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 90, bottom: 40),
              child: Image.asset(
                'assets/images/logotipo.png',
                width: 300,
                height: 300,
              ),
            ),
            Text(
              'Bem Vindo!',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: Theme.of(context).textTheme.displaySmall?.fontSize,
                fontStyle: Theme.of(context).textTheme.displaySmall?.fontStyle,
              ),
            ),
            Container(
              width: 330,
              margin: const EdgeInsets.only(top: 8, bottom: 90),
              child: Text(
                """Bem vindo a plataforma PhysioApp, facilite e agilize suas consultas, seja como paciente ou fisioterapeuta""",
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: 320,
              height: 60,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(50)),
              child: Row(
                mainAxisAlignment: !_optionProfilePhysio ? MainAxisAlignment.start : MainAxisAlignment.end,
                children: [
                  !_optionProfilePhysio
                      ? Container(
                          width: 150,
                          height: 60,
                          margin: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 236, 236, 236),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: TextButton(
                            onPressed: () {
                              setState(() => _optionProfilePhysio = true);
                            },
                            child: Text(
                              'Paciente',
                              style: TextStyle(
                                fontStyle: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.fontStyle,
                                fontWeight: FontWeight.w500,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.fontSize,
                                color: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.color,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        )
                      : Container(
                          width: 150,
                          height: 60,
                          margin: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 236, 236, 236),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: TextButton(
                            onPressed: () {
                              setState(() => _optionProfilePhysio = false);
                            },
                            child: Text(
                              'Fisioterapeuta',
                              style: TextStyle(
                                fontStyle: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.fontStyle,
                                fontWeight: FontWeight.w500,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.fontSize,
                                color: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.color,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: TextButton(
        onPressed: () {
          if (_optionProfilePhysio) {
            Navigator.of(context).pushNamed(AppRoutes.authPhysioPage);
          } else {
            Navigator.of(context).pushNamed(AppRoutes.authPatientPage);
          }
        },
        child: Text(
          'Próximo',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 19,
            fontStyle: Theme.of(context).textTheme.labelLarge?.fontStyle,
          ),
        ),
      ),
    );
  }
}
