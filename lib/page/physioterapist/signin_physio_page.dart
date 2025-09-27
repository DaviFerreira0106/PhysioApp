import 'package:flutter/material.dart';
import 'package:physioapp/components/physioterapist/form_signin.dart';

class SigninPhysioPage extends StatelessWidget {
  const SigninPhysioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_image_auth_physio.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(114, 20, 24, 27),
                Color.fromARGB(255, 20, 24, 27),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Entrar',
                    style: TextStyle(
                      fontFamily:
                          Theme.of(context).textTheme.displayMedium?.fontFamily,
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize:
                          Theme.of(context).textTheme.displayMedium?.fontSize,
                    ),
                  ),
                ],
              ),
              Text(
                'Acesse sua conta e otimize o acompanhamento dos seus pacientes.',
                style: TextStyle(
                  fontFamily: Theme.of(context).textTheme.bodyMedium?.fontFamily,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                )
              ),
              const SizedBox(
                height: 50,
              ),
              const FormSignIn(),
            ],
          ),
        ),
      ),
    );
  }
}
