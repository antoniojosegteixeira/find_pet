import 'package:find_pet/core/themes/ui/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Welcome'),
            ElevatedButton(
              onPressed: () {
                Modular.to.pushNamed('/login');
              },
              child: const Text('Login'),
            ),
            ElevatedButton(
              onPressed: () {
                Modular.to.pushNamed('/register');
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
