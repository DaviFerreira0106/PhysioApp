import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  AuthFormState createState() {
    return AuthFormState();
  }
}

class AuthFormState extends State<AuthForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          Form(
            child: Column(
              children: [
                Container(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text("Selecionar Foto"),
                      ),
                    ],
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Número Crefito"),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Nome Completo"),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "E-mail"),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Número de Telefone"),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Senha"),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Confirmar Senha"),
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          TextButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                const Color.fromARGB(255, 0, 111, 202),
              ),
              minimumSize: WidgetStatePropertyAll(Size(300, 50))
            ),
            onPressed: () {},
            child: const Text(
              "Cadastrar",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
