import 'package:flutter/material.dart';
import 'package:physioapp/components/physioterapist/auth/first_form_signup.dart';
import 'package:physioapp/exception/auth_signup_exception.dart';
import 'package:physioapp/services/auth/physio/auth_form.dart';
import 'package:physioapp/services/auth/physio/auth_service.dart';
import 'package:physioapp/utils/app_routes.dart';
import 'package:physioapp/components/physioterapist/auth/second_form_signup.dart';
import 'package:physioapp/utils/signup_page_form.dart';
import 'package:provider/provider.dart';
import 'package:physioapp/components/physioterapist/auth/image_picket.dart';

class SignupPhysioPage extends StatefulWidget {
  const SignupPhysioPage({super.key});

  @override
  State<SignupPhysioPage> createState() => _SignupPhysioPageState();
}

class _SignupPhysioPageState extends State<SignupPhysioPage> {
  Future<void> _dataSubmited(AuthFormData? authData) async {
    final auth = AuthService();
    final authException = AuthSignupException();
    final image = AuthFormData.imageProfile;
    final crefito = AuthFormData.crefito;
    final pageForm = Provider.of<SignUpPageForm>(context, listen: false);

    if (authData == null) return;

    if (image == null) {
      if (mounted) {
        return authException.showErrorValidate(
          message: 'Imagem não selecionada!',
          context: context,
        );
      }
    }

    try {
      await auth.signUp(
        physioType: authData.currentRadioValue,
        imageProfile: image!,
        name: authData.name!,
        email: authData.email!,
        password: authData.password!,
        crefito: crefito!,
      );

      if (mounted) {
        Provider.of<SignUpPageForm>(context, listen: false).toggleForm(
          value: pageForm.firstForm,
        );

        Navigator.of(context).pushNamedAndRemoveUntil(
          AppRoutes.homePagePhysio,
          (_) => false,
        );
      }
    } catch (error) {
      if (mounted) {
        return authException.showErrorValidate(
          message: error.toString(),
          context: context,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final pageForm = Provider.of<SignUpPageForm>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
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
                if (pageForm.secondPageForm) const ImagePicket(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Cadastre-se',
                      style: TextStyle(
                        fontFamily: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.fontFamily,
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
                if (pageForm.firstPageForm) const FirstFormSignUp(),
                if (pageForm.secondPageForm)
                  SecondFormSignUp(
                    onSubmited: _dataSubmited,
                  ),
                if (pageForm.secondPageForm)
                  TextButton(
                    onPressed: () {
                      Provider.of<SignUpPageForm>(context, listen: false)
                          .toggleForm(
                        value: pageForm.firstForm,
                      );
                    },
                    child: Text(
                      'Voltar',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        fontStyle:
                            Theme.of(context).textTheme.labelLarge?.fontStyle,
                      ),
                    ),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      value: pageForm.firstForm,
                      groupValue: pageForm.currentPageForm,
                      onChanged: (_) {},
                    ),
                    Radio(
                      value: pageForm.secondForm,
                      groupValue: pageForm.currentPageForm,
                      onChanged: (_) {},
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Já possui conta?',
                        style: TextStyle(
                          fontFamily: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.fontFamily,
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
                            fontFamily: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.fontFamily,
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
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          // Setando o valor do primeiro formlário no pop da tela.
          pageForm.toggleForm(value: pageForm.firstForm);
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
