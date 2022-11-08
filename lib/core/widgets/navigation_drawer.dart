import 'package:find_pet/core/hive/services/session.service.dart';
import 'package:find_pet/core/themes/ui/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.colorDarkBlue_800,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 80, 24, 0),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            const Divider(
              thickness: 1,
              height: 10,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 30,
            ),
            ...userWidgets(),
            const Divider(
              thickness: 1,
              height: 10,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 30,
            ),
            DrawerItem(
                name: 'Configurações', icon: Icons.settings, onPressed: () {}),
            const SizedBox(
              height: 30,
            ),
            DrawerItem(
              name: 'Sair',
              icon: Icons.logout,
              onPressed: () {
                SessionService.logout();
                Modular.to.pushNamed('/');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem(
      {Key? key,
      required this.name,
      required this.icon,
      required this.onPressed})
      : super(key: key);

  final String name;
  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        height: 37,
        child: Row(
          children: [
            Icon(
              icon,
              size: 21,
              color: Colors.white,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              name,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

List<Widget> userWidgets() {
  if (SessionService.isLogged()) {
    return [
      DrawerItem(
        name: 'Minha Conta',
        icon: Icons.account_box_rounded,
        onPressed: () {
          Modular.to.pushNamed('/profile/');
        },
      ),
      const SizedBox(
        height: 30,
      ),
      DrawerItem(name: 'Posts', icon: Icons.message_outlined, onPressed: () {}),
      const SizedBox(
        height: 30,
      ),
      DrawerItem(
        name: 'Novo Post',
        icon: Icons.add,
        onPressed: () {
          Modular.to.pushNamed('/post-animal/');
        },
      ),
      const SizedBox(
        height: 30,
      ),
    ];
  } else {
    return [
      DrawerItem(
        name: 'Fazer Login',
        icon: Icons.account_box_rounded,
        onPressed: () {
          Modular.to.navigate('/login/');
        },
      ),
      const SizedBox(
        height: 30,
      ),
      DrawerItem(
        name: 'Criar Conta',
        icon: Icons.person_add,
        onPressed: () {
          Modular.to.pushNamed('/register/');
        },
      ),
      const SizedBox(
        height: 30,
      ),
    ];
  }
}
