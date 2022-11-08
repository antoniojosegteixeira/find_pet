import 'package:equatable/equatable.dart';

class RegisterUserEntity extends Equatable {
  const RegisterUserEntity({
    required this.id,
    required this.email,
    required this.username,
    required this.city,
    required this.state,
    required this.country,
  });

  final String id;
  final String email;
  final String username;
  final String city;
  final String state;
  final String country;

  @override
  List<Object?> get props => [];
}
