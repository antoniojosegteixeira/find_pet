import 'package:find_pet/bootstrap.dart';
import 'package:find_pet/core/themes/ui/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  bootstrap(() => const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        backgroundColor: AppColors.colorNeutral_50,
        appBarTheme: const AppBarTheme(color: Color(0xFFF3F4F9)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFFF3F4F9),
        ),
      ),
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
    );
  }
}
