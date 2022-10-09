part of 'register_cubit.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterDone extends RegisterState {
  const RegisterDone({required this.registeredUser});

  final RegisterUserEntity registeredUser;
  @override
  List<Object> get props => [registeredUser];
}

class RegisterError extends RegisterState {}
