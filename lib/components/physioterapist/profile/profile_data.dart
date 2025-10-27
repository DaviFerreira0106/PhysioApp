import 'package:flutter/material.dart';
import 'package:physioapp/model/user/physio/physio_user.dart';
import 'package:physioapp/services/profile/physio/physio_profile_service.dart';
import 'package:provider/provider.dart';

class ProfileData extends StatelessWidget {
  final PhysioUser physioUser;
  const ProfileData({super.key, required this.physioUser});

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<PhysioProfileService>(context);
    Widget _listTileData({
      required IconData icon,
      required String title,
      required String subtitle,
    }) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 236, 236, 236),
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 1),
              blurRadius: 1,
              spreadRadius: 1,
            )
          ],
        ),
        child: ListTile(
          leading: Icon(
            icon,
            color: Theme.of(context).textTheme.labelSmall?.color,
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 14,
              color: Theme.of(context).textTheme.labelSmall?.color,
            ),
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.edit,
              color: Theme.of(context).textTheme.labelSmall?.color,
            ),
          ),
        ),
      );
    }

    return Column(
      children: [
        _listTileData(
          icon: Icons.person,
          title: 'Nome',
          subtitle: profileProvider.isVisible
              ? physioUser.name
              : physioUser.obscureText(physioUser.name),
        ),
        _listTileData(
          icon: Icons.mail,
          title: 'Email',
          subtitle: profileProvider.isVisible
              ? physioUser.email
              : physioUser.obscureText(physioUser.email),
        ),
      ],
    );
  }
}
