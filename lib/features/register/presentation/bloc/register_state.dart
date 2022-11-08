part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterError extends RegisterState {}

class RegisterDone extends RegisterState {
  const RegisterDone({required this.user});

  final RegisterUserEntity user;
}
