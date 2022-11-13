import 'package:equatable/equatable.dart';

class UserPostsResultEntity extends Equatable {
  const UserPostsResultEntity({
    required this.id,
    this.name,
    required this.age,
    required this.species,
    this.breed,
    required this.color,
    required this.contact,
    required this.city,
    required this.state,
    required this.address,
    required this.postType,
    this.images,
    required this.isResolved,
    required this.author,
  });

  final int id;
  final String? name;
  final String age;
  final String species;
  final String? breed;
  final String color;
  final String contact;
  final String city;
  final String state;
  final String address;
  final String postType;
  final List<dynamic>? images;
  final bool isResolved;
  final int author;

  @override
  List<Object?> get props => [];
}
