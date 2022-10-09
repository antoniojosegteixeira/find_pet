import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:find_pet/core/error/failures.dart';
import 'package:find_pet/features/login/domain/entities/user_entity.dart';
import 'package:find_pet/features/login/domain/usecases/login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.usecase}) : super(LoginInitial());

  LoginUseCase usecase;

  Future<void> doLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());

    try {
      final Either<Failure, LoginUserEntity> failureOrLogin =
          await usecase.call(
        Params(email: email, password: password),
      );

      failureOrLogin.fold(
        (l) => emit(LoginError()),
        (r) => emit(LoginDone(loggedUser: r)),
      );
    } catch (err) {
      emit(LoginError());
    }
  }
}
