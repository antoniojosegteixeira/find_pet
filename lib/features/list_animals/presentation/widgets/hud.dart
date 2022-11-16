import 'package:find_pet/core/themes/ui/app_colors.dart';
import 'package:flutter/material.dart';

class Hud extends StatefulWidget {
  const Hud({Key? key}) : super(key: key);

  @override
  State<Hud> createState() => _HudState();
}

class _HudState extends State<Hud> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    if (!isOpen) {
      return SizedBox(
        height: 50,
        width: 50,
        child: IconButton(
          onPressed: () {
            setState(() {
              isOpen = true;
            });
          },
          icon: const Icon(Icons.menu),
          color: AppColors.colorNeutral_900,
          splashRadius: 25,
        ),
      );
    }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Text(
              'Side menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.input),
            title: const Text('Welcome'),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(Icons.verified_user),
            title: const Text('Profile'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.border_color),
            title: const Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
