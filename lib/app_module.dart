import 'package:find_pet/features/login/login_module.dart';
import 'package:find_pet/features/register/register_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute<dynamic>(
          '/',
          module: RegisterModule(),
        ),
        ModuleRoute<dynamic>('/register', module: RegisterModule()),
        ModuleRoute<dynamic>('/login', module: LoginModule()),
      ];
}
