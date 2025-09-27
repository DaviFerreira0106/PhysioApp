import 'package:flutter/material.dart';

class FormSignIn extends StatefulWidget {
  const FormSignIn({super.key});

  @override
  FormSignInState createState() => FormSignInState();
}

class FormSignInState extends State<FormSignIn> {
  bool _vibilityPassword = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
 

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 20),
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                  color: const Color.fromARGB(255, 110, 125, 162), width: 1),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                label: Text(
                  'Email',
                  style: TextStyle(
                    fontFamily:
                        Theme.of(context).textTheme.bodyMedium?.fontFamily,
                    color: Theme.of(context).textTheme.labelMedium?.color,
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                  color: const Color.fromARGB(255, 110, 125, 162), width: 1),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                label: Text(
                  'Senha',
                  style: TextStyle(
                    fontFamily:
                        Theme.of(context).textTheme.bodyMedium?.fontFamily,
                    color: Theme.of(context).textTheme.labelMedium?.color,
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                border: InputBorder.none,
                suffixIcon: _vibilityPassword == true
                    ? GestureDetector(
                        onTap: () {
                          setState(
                              () => _vibilityPassword = !_vibilityPassword);
                        },
                        child: Icon(
                          Icons.visibility_outlined,
                          color: Theme.of(context).textTheme.labelLarge?.color,
                          size: 22,
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          setState(
                              () => _vibilityPassword = !_vibilityPassword);
                        },
                        child: Icon(
                          Icons.visibility_off_outlined,
                          color: Theme.of(context).textTheme.labelLarge?.color,
                          size: 22,
                        ),
                      ),
              ),
              keyboardType: TextInputType.visiblePassword,
              obscureText: _vibilityPassword == true ? false : true,
              controller: _passwordController,
            ),
          ),
          // Row(
          //   children: [
          //     RadioListTile(value: ,)
          //   ],
          // )
        ],
      ),
    );
  }
}
