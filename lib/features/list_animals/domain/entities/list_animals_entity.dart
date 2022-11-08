import 'package:equatable/equatable.dart';

class ListAnimalsEntity extends Equatable {
  const ListAnimalsEntity({
    required this.id,
    required this.url,
    this.name,
    this.sex,
    required this.species,
    this.breed,
    required this.color,
    this.age,
  });

  final String id;
  final String url;
  final String? name;
  final String? sex;
  final String species;
  final String? breed;
  final String color;
  final String? age;

  @override
  List<Object?> get props => [];
}
