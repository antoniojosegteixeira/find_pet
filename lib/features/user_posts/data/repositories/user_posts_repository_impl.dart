import 'package:dartz/dartz.dart';
import 'package:find_pet/core/error/failures.dart';
import 'package:find_pet/features/user_posts/data/datasources/user_posts_datasource.dart';
import 'package:find_pet/features/user_posts/data/models/user_posts_page_model.dart';
import 'package:find_pet/features/user_posts/domain/repositories/user_posts_repository.dart';

class UserPostsRepositoryImpl implements UserPostsRepository {
  UserPostsRepositoryImpl({
    required this.remoteDatasource,
  });

  final UserPostsDatasource remoteDatasource;

  @override
  Future<Either<Failure, UserPostsPageModel>> getUserPosts({
    String? name,
    String? sex,
    String? species,
    String? breed,
    String? color,
    String? age,
  }) async {
    try {
      final response = await remoteDatasource.getUserPosts(
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
