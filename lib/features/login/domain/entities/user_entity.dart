import 'package:equatable/equatable.dart';

class LoginUserEntity extends Equatable {
  const LoginUserEntity({
    required this.id,
    required this.email,
    required this.verifiedEmail,
    required this.firstName,
    required this.lastName,
    required this.sessionToken,
  });

  final int id;
  final int email;
  final bool verifiedEmail;
  final String firstName;
  final String lastName;
  final String sessionToken;

  @override
  List<Object?> get props => [];
}
