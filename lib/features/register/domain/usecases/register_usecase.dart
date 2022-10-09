import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:find_pet/core/error/failures.dart';
import 'package:find_pet/core/usecase/usecase.dart';
import 'package:find_pet/features/register/domain/entities/user_entity.dart';
import 'package:find_pet/features/register/domain/repositories/register_repository.dart';

class RegisterUseCase implements UseCase<RegisterUserEntity, Params> {
  RegisterUseCase({required this.repository});

  final RegisterRepository repository;

  @override
  Future<Either<Failure, RegisterUserEntity>> call(
    Params params,
  ) async {
    return repository.registerUser(
      email: params.email,
      password: params.password,
      firstName: params.firstName,
      lastName: params.lastName,
    );
  }
}

class Params extends Equatable {
  const Params({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
  });

  final String email;
  final String password;
  final String firstName;
  final String lastName;

  @override
  List<Object?> get props => [
        email,
        password,
        firstName,
        lastName,
      ];
}
