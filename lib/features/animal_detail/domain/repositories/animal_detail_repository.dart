import 'package:dartz/dartz.dart';
import 'package:find_pet/core/error/failures.dart';
import 'package:find_pet/features/animal_detail/domain/entities/animal_detail_entity.dart';

abstract class AnimalDetailRepository {
  Future<Either<Failure, AnimalDetailEntity>> getAnimal({
    required String id,
  });
}
