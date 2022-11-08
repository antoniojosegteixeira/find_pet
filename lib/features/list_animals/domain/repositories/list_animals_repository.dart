import 'package:dartz/dartz.dart';
import 'package:find_pet/core/error/failures.dart';
import 'package:find_pet/features/list_animals/domain/entities/list_animals_page_entity.dart';

abstract class ListAnimalsRepository {
  Future<Either<Failure, ListAnimalsPageEntity>> listAnimals({
    String? name,
    String? sex,
    required String species,
    String? breed,
    required String color,
    String? age,
  });
}
