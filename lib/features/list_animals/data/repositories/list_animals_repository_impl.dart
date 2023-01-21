import 'package:dartz/dartz.dart';
import 'package:find_pet/core/error/failures.dart';
import 'package:find_pet/features/list_animals/data/datasources/list_animals_datasource.dart';
import 'package:find_pet/core/list_animals/models/list_animals_page_model.dart';
import 'package:find_pet/features/list_animals/domain/repositories/list_animals_repository.dart';

class ListAnimalsRepositoryImpl implements ListAnimalsRepository {
  ListAnimalsRepositoryImpl({
    required this.remoteDatasource,
  });

  final ListAnimalsDatasource remoteDatasource;

  @override
  Future<Either<Failure, ListAnimalsPageModel>> listAnimals({
    String? name,
    String? sex,
    String? species,
    String? breed,
    String? color,
    String? age,
  }) async {
    try {
      final response = await remoteDatasource.listAnimals(
        name: name!,
        sex: sex!,
        species: species!,
        breed: breed!,
        color: color!,
        age: age!,
      );
      return Right(response);
    } catch (err) {
      return Left(ServerFailure());
    }
  }
}
