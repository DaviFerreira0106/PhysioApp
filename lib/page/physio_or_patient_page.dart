import 'package:flutter/material.dart';
import 'package:physioapp/utils/app_routes.dart';

class PhysioOrPatientPage extends StatefulWidget {
  const PhysioOrPatientPage({super.key});

  @override
  PhysioOrPatientPageState createState() => PhysioOrPatientPageState();
}

class PhysioOrPatientPageState extends State<PhysioOrPatientPage>
    with SingleTickerProviderStateMixin {
  // Atributos de controle
  bool _optionProfilePhysio = false;
  final double _widthContainer = 310;
  final double _widthContainerOption = 150;
  final double _paddingContainer = 5;

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
              width: _widthContainer,
              height: 60,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(50)),
              child: Stack(
                children: [
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.easeIn,
                    left: _optionProfilePhysio
                        ? _widthContainer -
                            _widthContainerOption -
                            _paddingContainer
                        : _paddingContainer,
                    child: Container(
                      width: _widthContainerOption,
                      height: 50,
                      margin: const EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 236, 236, 236),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(
                            () => _optionProfilePhysio == false
                                ? _optionProfilePhysio = true
                                : _optionProfilePhysio = false,
                          );
                        },
                        child: !_optionProfilePhysio
                            ? Text(
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
                              )
                            : Text(
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
