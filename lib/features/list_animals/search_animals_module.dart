import 'package:find_pet/features/list_animals/presentation/pages/animal_details_page.dart';
import 'package:find_pet/features/list_animals/presentation/pages/main_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SearchAnimalsModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute<dynamic>(
          '/',
          child: (context, args) => MainPage(),
        ),
        ChildRoute<dynamic>(
          '/details/:postId',
          child: (context, args) =>
              AnimalDetailsPage(postId: args.params['postId']),
        ),
      ];
}
