import 'package:dartz/dartz.dart';
import 'package:find_pet/core/error/failures.dart';
import 'package:find_pet/features/login/data/datasources/login_datasource.dart';
import 'package:find_pet/features/login/domain/entities/user_entity.dart';
import 'package:find_pet/features/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl({
    required this.remoteDatasource,
  });

  final LoginDatasource remoteDatasource;

  @override
  Future<Either<Failure, LoginUserEntity>> loginWithEmailAndPassword({
    String? email,
    String? password,
  }) async {
    try {
      final login = await remoteDatasource.login(
        email: email!,
        password: password!,
      );
      return Right(login);
    } catch (err) {
      return Left(ServerFailure());
    }
  }
}
