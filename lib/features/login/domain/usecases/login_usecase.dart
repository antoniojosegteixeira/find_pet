import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:find_pet/core/error/failures.dart';
import 'package:find_pet/core/usecase/usecase.dart';
import 'package:find_pet/features/login/domain/entities/user_entity.dart';
import 'package:find_pet/features/login/domain/repositories/login_repository.dart';

class LoginUseCase implements UseCase<UserEntity, Params> {
  LoginUseCase({required this.repository});

  final LoginRepository repository;

  @override
  Future<Either<Failure, UserEntity>> call(
    Params params,
  ) async {
    return repository.loginWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
  }
}

class Params extends Equatable {
  const Params({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object?> get props => [
        email,
        password,
      ];
}
