import 'package:flutter/material.dart';
import 'package:physioapp/components/patient/profile/change_email_form.dart';
import 'package:physioapp/components/patient/profile/change_name_form.dart';
import 'package:physioapp/components/patient/profile/list_tile_component.dart';
import 'package:physioapp/model/user/patient/patient_user.dart';
import 'package:physioapp/services/profile/patient/patient_profile_service.dart';
import 'package:provider/provider.dart';

class ProfileDataPatient extends StatelessWidget {
  final PatientUser patientUser;
  final void Function() refreshPage;
  const ProfileDataPatient(
      {super.key, required this.patientUser, required this.refreshPage});
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
        return ChangeNameForm(
          refreshPage: refreshPage,
        );
      },
    );
  }

  void _showChangEmailForm({
    required BuildContext context,
  }) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ChangeEmailForm(
            refreshPage: refreshPage,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<PatientProfileService>(context);

    return Column(
      children: [
        _listTileData(
          context: context,
          icon: Icons.person,
          title: 'Nome',
          fn: (context) => _showChangNameForm(context: context),
          subtitle: profileProvider.isVisible
              ? patientUser.name
              : patientUser.obscureText(patientUser.name),
        ),
        _listTileData(
          context: context,
          icon: Icons.mail,
          title: 'Email',
          fn: (context) => _showChangEmailForm(context: context),
          subtitle: profileProvider.isVisible
              ? patientUser.email
              : patientUser.obscureText(patientUser.email),
        ),
      ],
    );
  }
}
