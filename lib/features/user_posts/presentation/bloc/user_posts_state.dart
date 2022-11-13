part of 'user_posts_bloc.dart';

abstract class UserPostsState extends Equatable {
  const UserPostsState();

  @override
  List<Object> get props => [];
}

class UserPostsInitial extends UserPostsState {}

class UserPostsLoading extends UserPostsState {}

class UserPostsDone extends UserPostsState {
  const UserPostsDone({required this.userPostsPage});

  final UserPostsPageEntity userPostsPage;
}

class UserPostsError extends UserPostsState {}
