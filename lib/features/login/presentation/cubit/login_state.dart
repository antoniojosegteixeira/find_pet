part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginDone extends LoginState {
  const LoginDone({required this.loggedUser});

  final LoginUserEntity loggedUser;
  @override
  List<Object> get props => [loggedUser];
}

class LoginError extends LoginState {}
