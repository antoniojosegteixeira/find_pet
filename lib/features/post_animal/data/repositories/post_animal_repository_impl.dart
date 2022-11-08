import 'package:dartz/dartz.dart';
import 'package:find_pet/core/error/failures.dart';
import 'package:find_pet/features/post_animal/data/datasources/post_animal_datasource.dart';
import 'package:find_pet/features/post_animal/data/models/animal_model.dart';
import 'package:find_pet/features/post_animal/domain/repositories/post_animal_repository.dart';

class PostAnimalRepositoryImpl implements PostAnimalRepository {
  PostAnimalRepositoryImpl({
    required this.remoteDatasource,
  });

  final PostAnimalDatasource remoteDatasource;

  @override
  Future<Either<Failure, PostAnimalModel>> postAnimal({
    String? name,
    String? sex,
    required String species,
    String? breed,
    required String color,
    String? age,
    String? image,
  }) async {
    try {
      final response = await remoteDatasource.postAnimal(
          name: name!,
          sex: sex!,
          species: species,
          breed: breed!,
          color: color,
          age: age!,
          image: image!);
      return Right(response);
    } catch (err) {
      return Left(ServerFailure());
    }
  }
}
