import 'package:dartz/dartz.dart';
import 'package:find_pet/core/error/failures.dart';
import 'package:find_pet/features/animal_detail/data/datasources/animal_detail_datasource.dart';
import 'package:find_pet/features/animal_detail/domain/entities/animal_detail_entity.dart';
import 'package:find_pet/features/animal_detail/domain/repositories/animal_detail_repository.dart';

class AnimalDetailRepositoryImpl implements AnimalDetailRepository {
  AnimalDetailRepositoryImpl({
    required this.remoteDatasource,
  });

  final AnimalDetailDatasource remoteDatasource;

  @override
  Future<Either<Failure, AnimalDetailEntity>> getAnimal({
    required String id,
  }) async {
    try {
      final response = await remoteDatasource.getAnimal(
        id: id,
      );
      return Right(response);
    } catch (err) {
      return Left(ServerFailure());
    }
  }
}
