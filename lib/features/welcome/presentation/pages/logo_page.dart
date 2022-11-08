import 'dart:async';

import 'package:find_pet/core/themes/ui/app_colors.dart';
import 'package:find_pet/core/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LogoPage extends StatefulWidget {
  const LogoPage({Key? key}) : super(key: key);

  @override
  State<LogoPage> createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {
  @override
  void initState() {
    /*
    Timer(const Duration(seconds: 2), () {
      Modular.to.pushNamed('/welcome');
    });
    */
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 450),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  Image.asset('assets/images/hero.png', fit: BoxFit.fitHeight),
                  Text(
                    'FindPet',
                    style: TextStyle(
                      color: AppColors.colorDarkBlue_900,
                      fontWeight: FontWeight.w900,
                      fontSize: 48,
                      fontFamily: 'headlinefont',
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  MainButton(
                    text: 'CRIAR CONTA',
                    onPressed: () {
                      Modular.to.pushNamed('/register');
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  MainButton(
                    text: 'FAZER LOGIN',
                    textColor: AppColors.colorDarkBlue_800,
                    backgroundColor: AppColors.colorBlue_50,
                    onPressed: () {
                      Modular.to.pushNamed('/login');
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  GestureDetector(
                    onTap: () {
                      Modular.to.pushNamed('/search-animals');
                    },
                    child: Text(
                      'Pular por enquanto e buscar animais',
                      style: TextStyle(
                        color: AppColors.colorDarkBlue_800,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.colorDarkBlue_800,
                        decorationThickness: 1,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
