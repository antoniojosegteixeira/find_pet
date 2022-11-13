part of 'user_posts_bloc.dart';

abstract class UserPostsEvent extends Equatable {
  const UserPostsEvent();

  @override
  List<Object> get props => [];
}

class GetUserAnimalList extends UserPostsEvent {}
