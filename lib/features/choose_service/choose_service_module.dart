import 'package:find_pet/features/choose_service/presentation/pages/choose_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ChooseServiceModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute<dynamic>(
          '/',
          child: (context, args) => const ChooseServicePage(),
        )
      ];
}
