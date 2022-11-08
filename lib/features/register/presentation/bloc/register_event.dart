part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class RegisterUser extends RegisterEvent {
  RegisterUser({
    required this.email,
    required this.password,
    required this.username,
    required this.city,
    required this.state,
    required this.country,
  });

  final String email;
  final String password;
  final String username;
  final String city;
  final String state;
  final String country;
}
