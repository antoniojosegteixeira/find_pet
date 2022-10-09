import 'package:dartz/dartz.dart';
import 'package:find_pet/core/error/failures.dart';
import 'package:find_pet/features/register/data/datasources/register_datasource.dart';
import 'package:find_pet/features/register/data/models/user_model.dart';
import 'package:find_pet/features/register/domain/repositories/register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  RegisterRepositoryImpl({
    required this.remoteDatasource,
  });

  final RegisterDatasource remoteDatasource;

  @override
  Future<Either<Failure, RegisterUserModel>> registerUser({
    String? email,
    String? password,
    String? firstName,
    String? lastName,
  }) async {
    try {
      final register = await remoteDatasource.registerUser(
        email: email!,
        password: password!,
        firstName: firstName!,
        lastName: lastName!,
      );
      return Right(register);
    } catch (err) {
      return Left(ServerFailure());
    }
  }
}
