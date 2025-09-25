import 'package:flutter/material.dart';

class AuthPhysioPage extends StatelessWidget {
  const AuthPhysioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/background_image_auth_physio.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Junte-se a nós \n& atenda com Confiança',
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.center,
            ),
            Container(
              height: 60,
              width: double.infinity,
              margin: const EdgeInsets.only(
                top: 60,
                right: 16,
                left: 16,
              ),
              child: ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    Theme.of(context).colorScheme.primary,
                  ),
                ),
                onPressed: () {},
                label: Text(
                  'Entre com email e senha',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                    fontFamily:
                        Theme.of(context).textTheme.titleLarge?.fontFamily,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                icon: const Icon(
                  Icons.mail_outline_outlined,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }
}
