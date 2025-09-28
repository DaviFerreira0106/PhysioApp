import 'package:flutter/material.dart';
import 'package:physioapp/components/physioterapist/form_signup.dart';
import 'package:physioapp/utils/app_routes.dart';

enum SignUpfirstForm {
  firstForm,
  secondForm,
}

class SignupPhysioPage extends StatefulWidget {
  const SignupPhysioPage({super.key});

  @override
  State<SignupPhysioPage> createState() => _SignupPhysioPageState();
}

class _SignupPhysioPageState extends State<SignupPhysioPage> {
  SignUpfirstForm _signUpfirstForm = SignUpfirstForm.firstForm;
  bool _firstPageForm() => _signUpfirstForm == SignUpfirstForm.firstForm;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/background_image_auth_physio.png',
              ),
              fit: BoxFit.cover),
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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Cadastre-se',
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
                'Cadastre-se e comece a acompanhar e orientar seus pacientes de forma prática e eficiente.',
                style: TextStyle(
                  fontFamily:
                      Theme.of(context).textTheme.bodyMedium?.fontFamily,
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const FormSignUp(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio<SignUpfirstForm>(
                    value: SignUpfirstForm.firstForm,
                    groupValue: _signUpfirstForm,
                    onChanged: (value) {},
                  ),
                  Radio<SignUpfirstForm>(
                    value: SignUpfirstForm.secondForm,
                    groupValue: _signUpfirstForm,
                    onChanged: (value) {},
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 24, bottom: 64),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Já possui conta?',
                      style: TextStyle(
                        fontFamily:
                            Theme.of(context).textTheme.labelLarge?.fontFamily,
                        color: Theme.of(context).textTheme.labelLarge?.color,
                        fontSize:
                            Theme.of(context).textTheme.labelLarge?.fontSize,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context)
                          .pushNamed(AppRoutes.signInPhysioPage),
                      child: Text(
                        'Entre agora!',
                        style: TextStyle(
                          fontFamily:
                              Theme.of(context).textTheme.bodyLarge?.fontFamily,
                          fontSize:
                              Theme.of(context).textTheme.bodyLarge?.fontSize,
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.primary,
                          decoration: TextDecoration.underline,
                          decorationColor:
                              Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }
}
