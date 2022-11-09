part of 'user_posts_bloc.dart';

abstract class UserPostsState extends Equatable {
  const UserPostsState();  

  @override
  List<Object> get props => [];
}
class UserPostsInitial extends UserPostsState {}
