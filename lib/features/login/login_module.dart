import 'package:find_pet/features/login/data/datasources/login_datasource.dart';
import 'package:find_pet/features/login/data/repositories/login_repository_impl.dart';
import 'package:find_pet/features/login/domain/usecases/login_usecase.dart';
import 'package:find_pet/features/login/presentation/bloc/login_bloc.dart';
import 'package:find_pet/features/login/presentation/pages/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

class LoginModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => http.Client()),
        Bind.singleton((i) => LoginDatasourceImpl(client: i())),
        Bind.singleton((i) => LoginRepositoryImpl(remoteDatasource: i())),
        Bind.singleton((i) => LoginUseCase(repository: i())),
        Bind.factory((i) => LoginBloc(usecase: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute<dynamic>(
          '/',
          child: (context, args) => const LoginPage(),
        )
      ];
}
