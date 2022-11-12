import 'package:find_pet/features/list_animals/data/datasources/list_animals_datasource.dart';
import 'package:find_pet/features/list_animals/data/repositories/list_animals_repository_impl.dart';
import 'package:find_pet/features/list_animals/domain/usecases/list_animals_usecase.dart';
import 'package:find_pet/features/list_animals/presentation/bloc/list_animals_bloc.dart';
import 'package:find_pet/features/list_animals/presentation/pages/animal_details_page.dart';
import 'package:find_pet/features/list_animals/presentation/pages/main_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

class SearchAnimalsModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => http.Client()),
        Bind.singleton((i) => ListAnimalsDatasourceImpl(client: i())),
        Bind.singleton((i) => ListAnimalsRepositoryImpl(remoteDatasource: i())),
        Bind.singleton((i) => ListAnimalsUsecase(repository: i())),
        Bind.factory((i) => ListAnimalsBloc(usecase: i()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute<dynamic>(
          '/',
          child: (context, args) => const MainPage(),
        ),
        ChildRoute<dynamic>(
          '/details/:postId',
          child: (context, args) =>
              AnimalDetailsPage(postId: args.params['postId']),
        ),
      ];
}
