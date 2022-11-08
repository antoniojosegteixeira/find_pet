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
          icon: Icon(Icons.menu),
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
            leading: Icon(Icons.input),
            title: Text('Welcome'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
