import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:find_pet/core/error/failures.dart';
import 'package:find_pet/features/register/domain/entities/user_entity.dart';
import 'package:find_pet/features/register/domain/usecases/register_usecase.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.usecase}) : super(RegisterInitial());

  RegisterUseCase usecase;

  Future<void> doRegister({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    emit(RegisterLoading());

    try {
      final Either<Failure, RegisterUserEntity> failureOrRegister =
          await usecase.call(
        Params(
          email: email,
          password: password,
          firstName: firstName,
          lastName: lastName,
        ),
      );

      failureOrRegister.fold(
        (l) => emit(RegisterError()),
        (r) => emit(RegisterDone(registeredUser: r)),
      );
    } catch (err) {
      emit(RegisterError());
    }
  }
}
