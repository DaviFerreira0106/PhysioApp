import 'package:flutter/material.dart';
import 'package:physioapp/components/physioterapist/profile/change_email_form.dart';
import 'package:physioapp/components/physioterapist/profile/change_name_form.dart';
import 'package:physioapp/components/physioterapist/profile/list_tile_component.dart';
import 'package:physioapp/model/user/physio/physio_user.dart';
import 'package:physioapp/services/auth/physio/auth_physio_backend_service.dart';
import 'package:physioapp/services/auth/physio/auth_physio_service.dart';
import 'package:physioapp/services/profile/physio/physio_profile_service.dart';
import 'package:provider/provider.dart';

class ProfileData extends StatelessWidget {
  final PhysioUser physioUser;
  const ProfileData({super.key, required this.physioUser});
  Widget _listTileData({
    required IconData icon,
    required String title,
    required String subtitle,
    required BuildContext context,
    required void Function(BuildContext) fn,
  }) {
    return ListTileComponent(
      title: title,
      subtitle: subtitle,
      icon: icon,
      fn: fn,
    );
  }

  void _showChangNameForm({
    required BuildContext context,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const ChangeNameForm();
      },
    );
  }

  void _showChangEmailForm({
    required BuildContext context,
  }) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return const ChangeEmailForm();
        });
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<PhysioProfileService>(context);
    final currentUser = Provider.of<AuthPhysioService>(context);

    return Column(
      children: [
        _listTileData(
          context: context,
          icon: Icons.person,
          title: 'Nome',
          fn: (context) => _showChangNameForm(context: context),
          subtitle: profileProvider.isVisible
              ? currentUser.currentPhysioUser!.name
              : currentUser.currentPhysioUser!
                  .obscureText(currentUser.currentPhysioUser!.name),
        ),
        _listTileData(
          context: context,
          icon: Icons.mail,
          title: 'Email',
          fn: (context) => _showChangEmailForm(context: context),
          subtitle: profileProvider.isVisible
              ? currentUser.currentPhysioUser!.email
              : currentUser.currentPhysioUser!
                  .obscureText(currentUser.currentPhysioUser!.email),
        ),
      ],
    );
  }
}
