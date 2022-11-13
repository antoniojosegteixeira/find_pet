import 'package:equatable/equatable.dart';
import 'package:find_pet/features/user_posts/data/models/user_posts_result_model.dart';

class UserPostsPageEntity extends Equatable {
  const UserPostsPageEntity({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  final int count;
  final String? next;
  final String? previous;
  final List<UserPostsResultModel> results;

  @override
  List<Object?> get props => [];
}
