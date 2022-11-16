import 'package:find_pet/core/routes/routes.dart';
import 'package:find_pet/core/themes/ui/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:find_pet/core/themes/ui/app_fonts.dart';

class ChooseServicePage extends StatelessWidget {
  const ChooseServicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppBar appBar = AppBar();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: appBar,
      backgroundColor: AppColors.colorNeutral_50,
      body: LayoutBuilder(
        builder: (context, constraints) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Bem vindo ao FindPet!').headline3(),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                child: const Text("Quero buscar um animal perdido"),
                onPressed: () {
                  Modular.to.pushNamed(CustomRouter.emailConfirmation);
                },
              ),
              ElevatedButton(
                child: const Text("Quero anunciar um animal perdido"),
                onPressed: () {
                  Modular.to.pushNamed(CustomRouter.emailConfirmation);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
