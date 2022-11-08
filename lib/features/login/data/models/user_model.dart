import 'package:find_pet/features/login/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.email,
    required super.username,
    required super.city,
    required super.state,
    required super.country,
    required super.sessionToken,
    required super.refreshToken,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['user']['id'].toString(),
      email: json['user']['email'] as String,
      username: json['user']['username'] as String,
      city: json['user']['city'] as String,
      state: json['user']['state'] as String,
      country: json['user']['country'] as String,
      sessionToken: json['token']['access'] as String,
      refreshToken: json['token']['refresh'] as String,
    );
  }
}
