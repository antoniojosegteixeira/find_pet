import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:find_pet/core/error/failures.dart';
import 'package:find_pet/core/usecase/usecase.dart';
import 'package:find_pet/features/animal_detail/domain/entities/animal_detail_entity.dart';
import 'package:find_pet/features/animal_detail/domain/repositories/animal_detail_repository.dart';

class AnimalDetailUsecase
    implements UseCase<AnimalDetailEntity, AnimalDetailParams> {
  AnimalDetailUsecase({required this.repository});

  final AnimalDetailRepository repository;

  @override
  Future<Either<Failure, AnimalDetailEntity>> call(
    AnimalDetailParams params,
  ) async {
    return repository.getAnimal(
      id: params.id,
    );
  }
}

class AnimalDetailParams extends Equatable {
  const AnimalDetailParams({
    required this.id,
  });

  final String id;

  @override
  List<Object?> get props => [
        id,
      ];
}
