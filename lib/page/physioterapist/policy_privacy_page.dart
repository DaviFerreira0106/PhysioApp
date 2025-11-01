import 'package:flutter/material.dart';
import 'package:physioapp/services/navigation/bottom_nav_bar_controller.dart';
import 'package:physioapp/utils/app_routes.dart';
import 'package:provider/provider.dart';

class PolicyPrivacyPage extends StatelessWidget {
  const PolicyPrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final navigatorProvider =
        Provider.of<BottomNavBarPhysioController>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil(AppRoutes.tabPagePhysio, (_) => false);
            navigatorProvider.toggleIndex(index: 3);
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text('Politica de Privacidade'),
      ),
    );
  }
}
