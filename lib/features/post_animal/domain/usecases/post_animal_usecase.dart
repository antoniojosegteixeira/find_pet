import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:find_pet/core/error/failures.dart';
import 'package:find_pet/core/usecase/usecase.dart';
import 'package:find_pet/features/post_animal/domain/entities/post_animal_entity.dart';
import 'package:find_pet/features/post_animal/domain/repositories/post_animal_repository.dart';

class PostAnimalUseCase implements UseCase<PostAnimalEntity, PostAnimalParams> {
  PostAnimalUseCase({required this.repository});

  final PostAnimalRepository repository;

  @override
  Future<Either<Failure, PostAnimalEntity>> call(
    PostAnimalParams params,
  ) async {
    return repository.postAnimal(
      name: params.name!,
      age: params.age!,
      sex: params.sex,
      species: params.species,
      breed: params.breed!,
      color: params.color,
      contact: params.contact,
      city: params.city,
      countrystate: params.countrystate,
      address: params.address,
      postType: params.postType,
    );
  }
}

class PostAnimalParams extends Equatable {
  const PostAnimalParams({
    this.name,
    this.age,
    this.sex,
    required this.species,
    this.breed,
    required this.color,
    required this.contact,
    required this.city,
    required this.countrystate,
    required this.address,
    required this.postType,
  });

  final String? name;
  final String? age;
  final String? sex;
  final String species;
  final String? breed;
  final String color;
  final String contact;
  final String city;
  final String countrystate;
  final String address;
  final String postType;

  @override
  List<Object?> get props => [
        name,
        age,
        sex,
        species,
        breed,
        color,
        contact,
        city,
        countrystate,
        address,
        postType,
      ];
}
