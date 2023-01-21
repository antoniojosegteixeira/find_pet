import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:find_pet/core/error/failures.dart';
import 'package:find_pet/core/list_animals/entities/list_animals_page_entity.dart';
import 'package:find_pet/core/usecase/usecase.dart';
import 'package:find_pet/features/user_posts/domain/repositories/user_posts_repository.dart';

class UserPostsUsecase
    implements UseCase<ListAnimalsPageEntity, UserPostsParams> {
  UserPostsUsecase({required this.repository});

  final UserPostsRepository repository;

  @override
  Future<Either<Failure, ListAnimalsPageEntity>> call(
    UserPostsParams params,
  ) async {
    return repository.getUserPosts(
      name: params.name ?? '',
      sex: params.sex ?? '',
      species: params.species ?? '',
      breed: params.breed ?? '',
      color: params.color ?? '',
      age: params.age ?? '',
    );
  }
}

class UserPostsParams extends Equatable {
  const UserPostsParams({
    this.name,
    this.sex,
    this.species,
    this.breed,
    this.color,
    this.age,
  });

  final String? name;
  final String? sex;
  final String? species;
  final String? breed;
  final String? color;
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
