import 'package:flutter/material.dart';
import 'package:physioapp/utils/app_routes.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  BottomNavBarState createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  Widget _buttomIcons({required IconData icon, required String routePage}) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: IconButton(
        onPressed: () {
          Navigator.of(context).pushReplacementNamed(routePage);
        },
        icon: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 76,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(26),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buttomIcons(
            icon: Icons.home_filled,
            routePage: AppRoutes.homePagePhysio,
          ),
          _buttomIcons(
            icon: Icons.chat_bubble_rounded,
            routePage: AppRoutes.chatPagePhysio,
          ),
          _buttomIcons(
            icon: Icons.auto_awesome_mosaic_rounded,
            routePage: AppRoutes.exercisesPagePhysio,
          ),
          _buttomIcons(
            icon: Icons.person,
            routePage: AppRoutes.physioProfilePage,
          ),
          _buttomIcons(
            icon: Icons.add_circle_outlined,
            routePage: AppRoutes.scheduleAppointmentPage,
          ),
        ],
      ),
    );
  }
}
