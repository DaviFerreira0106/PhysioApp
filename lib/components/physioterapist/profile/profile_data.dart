import 'package:flutter/material.dart';
import 'package:physioapp/model/user/physio/physio_user.dart';
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
          onPressed: () {
            return fn(context);
          },
          icon: Icon(
            Icons.edit,
            color: Theme.of(context).textTheme.labelSmall?.color,
          ),
        ),
      ),
    );
  }

  Widget _defaultTextForm({required Widget textForm}) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: textForm,
    );
  }

  void _showChangNameForm({
    required BuildContext context,
  }) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 300,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _defaultTextForm(
                  textForm: TextFormField(
                    decoration: InputDecoration(
                      label: Text('Nome'),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    validator: (_name) {
                      String name = _name ?? '';

                      if (name.trim().length < 6) {
                        return 'Digite seu nome completo';
                      }
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Theme.of(context).colorScheme.tertiary,
                      ),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Atualizar',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  void _showChangEmailForm({
    required BuildContext context,
  }) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 300,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _defaultTextForm(
                  textForm: TextFormField(
                    decoration: InputDecoration(
                      label: Text('Email'),
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    validator: (_email) {
                      String email = _email ?? '';

                      if (email.trim().length < 3 || !email.contains('@')) {
                        return 'Digite um email válido';
                      }
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 15),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Theme.of(context).colorScheme.tertiary,
                      ),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Atualizar',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<PhysioProfileService>(context);

    return Column(
      children: [
        _listTileData(
          context: context,
          icon: Icons.person,
          title: 'Nome',
          fn: (context) => _showChangNameForm(context: context),
          subtitle: profileProvider.isVisible
              ? physioUser.name
              : physioUser.obscureText(physioUser.name),
        ),
        _listTileData(
          context: context,
          icon: Icons.mail,
          title: 'Email',
          fn: (context) => _showChangEmailForm(context: context),
          subtitle: profileProvider.isVisible
              ? physioUser.email
              : physioUser.obscureText(physioUser.email),
        ),
      ],
    );
  }
}
