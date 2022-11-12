import 'package:find_pet/features/animal_detail/data/datasources/animal_detail_datasource.dart';
import 'package:find_pet/features/animal_detail/data/repositories/animal_detail_repository.dart';
import 'package:find_pet/features/animal_detail/domain/usecases/animal_detail_usecase.dart';
import 'package:find_pet/features/animal_detail/presentation/bloc/animal_detail_bloc.dart';
import 'package:find_pet/features/animal_detail/presentation/pages/animal_details_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

class AnimalDetailModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => http.Client()),
        Bind.singleton((i) => AnimalDetailDatasourceImpl(client: i())),
        Bind.singleton(
            (i) => AnimalDetailRepositoryImpl(remoteDatasource: i())),
        Bind.singleton((i) => AnimalDetailUsecase(repository: i())),
        Bind.factory((i) => AnimalDetailBloc(usecase: i()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute<dynamic>(
          '/:postId',
          child: (context, args) => AnimalDetailsPage(
            postId: args.params['postId'],
          ),
        ),
      ];
}
