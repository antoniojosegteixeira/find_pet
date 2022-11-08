import 'package:find_pet/features/register/domain/entities/user_entity.dart';

class RegisterUserModel extends RegisterUserEntity {
  const RegisterUserModel({
    required super.id,
    required super.email,
    required super.username,
    required super.city,
    required super.state,
    required super.country,
  });

  factory RegisterUserModel.fromJson(Map<String, dynamic> json) {
    return RegisterUserModel(
      id: json['data']['id'].toString(),
      email: json['data']['email'] as String,
      username: json['data']['username'] as String,
      city: json['data']['city'] as String,
      state: json['data']['state'] as String,
      country: json['data']['country'] as String,
    );
  }
}
