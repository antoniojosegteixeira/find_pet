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
      sex: params.sex!,
      species: params.species,
      breed: params.breed!,
      color: params.color,
      age: params.age!,
    );
  }
}

class PostAnimalParams extends Equatable {
  const PostAnimalParams({
    this.name,
    this.sex,
    required this.species,
    this.breed,
    required this.color,
    this.age,
  });

  final String? name;
  final String? sex;
  final String species;
  final String? breed;
  final String color;
  final String? age;

  @override
  List<Object?> get props => [
        name,
        sex,
        species,
        breed,
        color,
        age,
      ];
}
