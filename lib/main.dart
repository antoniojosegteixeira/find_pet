import 'package:find_pet/bootstrap.dart';
import 'package:find_pet/core/hive/services/session.service.dart';
import 'package:find_pet/core/themes/ui/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SessionService.init();

  bootstrap(() => const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        backgroundColor: AppColors.colorNeutral_50,
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: AppColors.colorDarkBlue_800,
          foregroundColor: Colors.white,
        ),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFFF3F4F9),
        ),
        fontFamily: 'bodyfont',
      ),
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
    );
  }
}
