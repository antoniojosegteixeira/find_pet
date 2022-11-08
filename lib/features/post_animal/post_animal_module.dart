import 'package:find_pet/features/post_animal/presentation/bloc/post_animal_bloc.dart';
import 'package:find_pet/features/post_animal/presentation/pages/basic_informations_page.dart';
import 'package:find_pet/features/post_animal/presentation/pages/post_animal_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

class PostAnimalModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => http.Client()),
        Bind.factory((i) => PostAnimalBloc())
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute<dynamic>(
          '/',
          child: (context, args) => const PostAnimalPage(),
        ),
        ChildRoute<dynamic>(
          '/basic-information/',
          child: (context, args) => const BasicInformationsPage(),
        )
      ];
}
