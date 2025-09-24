import 'package:flutter/material.dart';
import 'package:physioapp/components/physioterapist/bottom_nav_bar.dart';

class ExercisesPagePhysio extends StatelessWidget {
  const ExercisesPagePhysio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Exercícios',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontStyle: Theme.of(context).textTheme.headlineMedium?.fontStyle,
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.9,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(top: 20, bottom: 60),
                color: const Color.fromARGB(56, 255, 193, 7),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.74,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 3 / 3.2,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                          ),
                          itemBuilder: (context, index) => Container(
                            color: const Color.fromARGB(27, 0, 0, 0),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Container(
                                  height: 164,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        // Color.fromARGB(255, 223, 224, 234),
                                        // Color.fromARGB(255, 233, 235, 240)
                                        Colors.blue,
                                        Colors.black,
                                      ],
                                    ),
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  child: CircleAvatar(
                                    maxRadius: 34,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          itemCount: 6,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Adicionar exercício'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 24,
              child: BottomNavBar(),
            ),
          ],
        ),
      ),
    );
  }
}
