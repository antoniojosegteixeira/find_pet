part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class DoLogin extends LoginEvent {
  const DoLogin({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;
}
