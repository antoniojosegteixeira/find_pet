import 'package:find_pet/features/welcome/presentation/pages/logo_page.dart';
import 'package:find_pet/features/welcome/presentation/pages/welcome_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class WelcomeModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute<dynamic>(
          '/',
          child: (context, args) => const LogoPage(),
        ),
        ChildRoute<dynamic>(
          '/welcome',
          child: (context, args) => const WelcomePage(),
        )
      ];
}
