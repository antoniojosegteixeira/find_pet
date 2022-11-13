import 'package:dartz/dartz.dart';
import 'package:find_pet/core/error/failures.dart';
import 'package:find_pet/features/user_posts/domain/entities/user_posts_page_entity.dart';

abstract class UserPostsRepository {
  Future<Either<Failure, UserPostsPageEntity>> getUserPosts({
    String? name,
    String? sex,
    String? species,
    String? breed,
    String? color,
    String? age,
  });
}
