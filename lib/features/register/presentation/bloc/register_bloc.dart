import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:find_pet/core/error/failures.dart';
import 'package:find_pet/features/register/domain/entities/user_entity.dart';
import 'package:find_pet/features/register/domain/usecases/register_usecase.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({
    required this.usecase,
  }) : super(RegisterInitial()) {
    on<RegisterEvent>(
      (event, emit) async {
        if (event is RegisterUser) {
          emit(RegisterLoading());

          try {
            final Either<Failure, RegisterUserEntity> failureOrRegister =
                await usecase.call(
              Params(
                email: event.email,
                password: event.password,
                username: event.username,
                city: event.city,
                state: event.state,
                country: event.country,
              ),
            );

            failureOrRegister.fold(
              (l) {
                emit(RegisterError());
              },
              (r) => emit(RegisterDone(user: r)),
            );
          } catch (err) {
            emit(RegisterError());
          }
        }
      },
    );
  }

  final RegisterUseCase usecase;
}
