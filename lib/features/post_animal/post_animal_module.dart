import 'package:find_pet/features/list_animals/domain/usecases/list_animals_usecase.dart';
import 'package:find_pet/features/post_animal/data/datasources/post_animal_datasource.dart';
import 'package:find_pet/features/post_animal/data/repositories/post_animal_repository_impl.dart';
import 'package:find_pet/features/post_animal/domain/usecases/post_animal_usecase.dart';
import 'package:find_pet/features/post_animal/presentation/bloc/post_animal_bloc.dart';
import 'package:find_pet/features/post_animal/presentation/pages/add_photo_page.dart';
import 'package:find_pet/features/post_animal/presentation/pages/basic_informations_page.dart';
import 'package:find_pet/features/post_animal/presentation/pages/location_page.dart';
import 'package:find_pet/features/post_animal/presentation/pages/post_animal_page.dart';
import 'package:find_pet/features/post_animal/presentation/pages/post_done_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

class PostAnimalModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => http.Client()),
        Bind.singleton((i) => PostAnimalDatasourceImpl(client: i())),
        Bind.singleton((i) => PostAnimalRepositoryImpl(remoteDatasource: i())),
        Bind.singleton((i) => PostAnimalUseCase(repository: i())),
        Bind.singleton((i) => PostAnimalBloc(usecase: i()))
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
        ),
        ChildRoute<dynamic>(
          '/add-photo/',
          child: (context, args) => const AddPhotoPage(),
        ),
        ChildRoute<dynamic>(
          '/add-localization/',
          child: (context, args) => const LocationPage(),
        ),
        ChildRoute<dynamic>(
          '/post-done/',
          child: (context, args) => const PostDonePage(),
        )
      ];
}
