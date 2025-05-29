import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:physioapp/controller/user_fisio_controller.dart';

class SettingsAccountForm extends StatefulWidget {
  const SettingsAccountForm({super.key});

  @override
  SettingsAccountFormState createState() {
    return SettingsAccountFormState();
  }
}

class SettingsAccountFormState extends State<SettingsAccountForm> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final user = Provider.of<UserFisioController>(context, listen: false);
    return SizedBox(
      width: mediaQuery.width,
      child: Container(
        padding: const EdgeInsets.all(20),
        width: mediaQuery.width * 0.9,
        child: Form(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, bottom: 30),
                padding: const EdgeInsets.all(10),
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
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Número Crefito'),
                ),
                initialValue: user.fisioUser.numberCrefito,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Nome'),
                ),
                initialValue: user.fisioUser.name,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('E-mail'),
                ),
                initialValue: user.fisioUser.email,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Telefone'),
                ),
                initialValue: user.fisioUser.numberTelephone,
              ),
              const SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: const WidgetStatePropertyAll(
                        Color.fromARGB(255, 0, 111, 202),
                      ),
                      minimumSize: WidgetStatePropertyAll(
                        Size(mediaQuery.width * 0.4, 50),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Atualizar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: const WidgetStatePropertyAll(
                        Colors.red,
                      ),
                      minimumSize: WidgetStatePropertyAll(
                        Size(mediaQuery.width * 0.4, 50),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Excluir',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
