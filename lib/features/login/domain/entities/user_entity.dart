import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'user_entity.g.dart';

@HiveType(typeId: 1)
class UserEntity extends Equatable {
  const UserEntity({
    required this.id,
    required this.email,
    required this.username,
    required this.city,
    required this.state,
    required this.country,
    required this.sessionToken,
    required this.refreshToken,
  });

  @HiveField(0)
  final String id;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String username;
  @HiveField(3)
  final String city;
  @HiveField(4)
  final String state;
  @HiveField(5)
  final String country;
  @HiveField(6)
  final String sessionToken;
  @HiveField(7)
  final String refreshToken;

  @override
  List<Object?> get props => [
        id,
        email,
        username,
        city,
        state,
        country,
        sessionToken,
        refreshToken,
      ];
}
