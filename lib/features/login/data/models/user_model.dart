import 'package:find_pet/features/login/domain/entities/user_entity.dart';

class LoginUserModel extends LoginUserEntity {
  const LoginUserModel({
    required super.id,
    required super.email,
    required super.verifiedEmail,
    required super.firstName,
    required super.lastName,
    required super.sessionToken,
  });

  factory LoginUserModel.fromJson(Map<String, dynamic> json) {
    return LoginUserModel(
      id: json['id'] as int,
      email: json['email'] as int,
      verifiedEmail: json['verified_email'] as bool,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      sessionToken: json['token'] as String,
    );
  }
}
