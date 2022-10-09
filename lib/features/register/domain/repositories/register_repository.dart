import 'package:dartz/dartz.dart';
import 'package:find_pet/core/error/failures.dart';
import 'package:find_pet/features/register/domain/entities/user_entity.dart';

abstract class RegisterRepository {
  Future<Either<Failure, RegisterUserEntity>> registerUser({
    String email,
    String password,
    String firstName,
    String lastName,
  });
}
