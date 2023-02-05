import 'package:find_pet/core/themes/ui/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 3.0),
      child: SizedBox(
        width: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shadowColor: Colors.transparent,
            foregroundColor: AppColors.colorDarkBlue_800,
            backgroundColor: AppColors.colorNeutral_200,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(3),
            ),
            elevation: 0,
            padding: const EdgeInsets.all(0),
          ),
          child: const Icon(
            Icons.settings,
          ),
          onPressed: () {
            Modular.to.pushNamed('/search-animals/search-filter/');
          },
        ),
      ),
    );
  }
}
