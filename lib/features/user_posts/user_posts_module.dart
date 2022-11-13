import 'package:find_pet/features/user_posts/data/datasources/user_posts_datasource.dart';
import 'package:find_pet/features/user_posts/data/repositories/user_posts_repository_impl.dart';
import 'package:find_pet/features/user_posts/domain/usecases/user_posts_usecase.dart';
import 'package:find_pet/features/user_posts/presentation/bloc/user_posts_bloc.dart';
import 'package:find_pet/features/user_posts/presentation/pages/user_posts.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;

class UserPostsModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton((i) => http.Client()),
        Bind.singleton((i) => UserPostsDatasourceImpl(client: i())),
        Bind.singleton((i) => UserPostsRepositoryImpl(remoteDatasource: i())),
        Bind.singleton((i) => UserPostsUsecase(repository: i())),
        Bind.factory((i) => UserPostsBloc(usecase: i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute<dynamic>(
          '/',
          child: (context, args) => const UserPostsPage(),
        )
      ];
}
