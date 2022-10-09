import 'package:find_pet/features/register/domain/entities/user_entity.dart';

class RegisterUserModel extends RegisterUserEntity {
  const RegisterUserModel({
    required super.id,
    required super.email,
    required super.verifiedEmail,
    required super.firstName,
    required super.lastName,
    required super.sessionToken,
  });

  factory RegisterUserModel.fromJson(Map<String, dynamic> json) {
    return RegisterUserModel(
      id: json['_id'] as String,
      email: json['email'] as String,
      verifiedEmail: json['verifiedEmail'] == 'true' ? true : false,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      sessionToken: json['sessionToken'] as String,
    );
  }
}
