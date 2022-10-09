import 'package:equatable/equatable.dart';

class RegisterUserEntity extends Equatable {
  const RegisterUserEntity({
    required this.id,
    required this.email,
    required this.verifiedEmail,
    required this.firstName,
    required this.lastName,
    required this.sessionToken,
  });

  final String id;
  final String email;
  final bool verifiedEmail;
  final String firstName;
  final String lastName;
  final String sessionToken;

  @override
  List<Object?> get props => [];
}
