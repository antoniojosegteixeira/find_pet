import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:find_pet/core/error/failures.dart';
import 'package:find_pet/features/login/domain/entities/user_entity.dart';
import 'package:find_pet/features/login/domain/usecases/login_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required this.usecase,
  }) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is DoLogin) {
        emit(LoginLoading());

        try {
          final Either<Failure, UserEntity> failureOrLogin = await usecase.call(
            Params(
              email: event.email,
              password: event.password,
            ),
          );

          failureOrLogin.fold(
            (l) => emit(LoginError()),
            (r) => emit(LoginDone()),
          );
        } catch (err) {
          emit(LoginError());
        }
      }
    });
  }
  final LoginUseCase usecase;
}
