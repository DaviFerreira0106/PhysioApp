import 'package:flutter/material.dart';
import 'package:physioapp/model/navigation/bottom_nav_bar_controller.dart';
import 'package:physioapp/utils/app_routes.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  BottomNavBarState createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  Widget _buttomIcons({
    required IconData icon,
    required String routePage,
    required IndexPage indexPage,
  }) {
    final bottomNavProvider = Provider.of<BottomNavBarController>(
      context,
      listen: false,
    );
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: bottomNavProvider.getCurrentPage == indexPage
            ? Theme.of(context).primaryColor
            : Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: IconButton(
        onPressed: () {
          Navigator.of(context).pushReplacementNamed(routePage);
          bottomNavProvider.setCurrentPage(indexPage: indexPage);
        },
        icon: Icon(
          icon,
          color: bottomNavProvider.getCurrentPage == indexPage
              ? Colors.white
              : Theme.of(context).textTheme.labelLarge?.color,
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
            indexPage: IndexPage.home,
          ),
          _buttomIcons(
            icon: Icons.chat_bubble_rounded,
            routePage: AppRoutes.chatPagePhysio,
            indexPage: IndexPage.chat,
          ),
          _buttomIcons(
            icon: Icons.auto_awesome_mosaic_rounded,
            routePage: AppRoutes.exercisesPagePhysio,
            indexPage: IndexPage.exercises,
          ),
          _buttomIcons(
            icon: Icons.person,
            routePage: AppRoutes.physioProfilePage,
            indexPage: IndexPage.profile,
          ),
          _buttomIcons(
            icon: Icons.add_circle_outlined,
            routePage: AppRoutes.scheduleAppointmentPage,
            indexPage: IndexPage.addQuery,
          ),
        ],
      ),
    );
  }
}
