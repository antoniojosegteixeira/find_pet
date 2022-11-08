part of 'post_animal_bloc.dart';

abstract class PostAnimalState extends Equatable {
  const PostAnimalState();
  
  @override
  List<Object> get props => [];
}

class PostAnimalInitial extends PostAnimalState {}
