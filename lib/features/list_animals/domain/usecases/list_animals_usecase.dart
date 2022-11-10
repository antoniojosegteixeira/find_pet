import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:find_pet/core/error/failures.dart';
import 'package:find_pet/core/usecase/usecase.dart';
import 'package:find_pet/features/list_animals/domain/entities/list_animals_page_entity.dart';
import 'package:find_pet/features/list_animals/domain/repositories/list_animals_repository.dart';

class ListAnimalsUsecase
    implements UseCase<ListAnimalsPageEntity, ListAnimalsParams> {
  ListAnimalsUsecase({required this.repository});

  final ListAnimalsRepository repository;

  @override
  Future<Either<Failure, ListAnimalsPageEntity>> call(
    ListAnimalsParams params,
  ) async {
    return repository.listAnimals(
      name: params.name!,
      sex: params.sex!,
      species: params.species,
      breed: params.breed!,
      color: params.color,
      age: params.age!,
    );
  }
}

class ListAnimalsParams extends Equatable {
  const ListAnimalsParams({
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
