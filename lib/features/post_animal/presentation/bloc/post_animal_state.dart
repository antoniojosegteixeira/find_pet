part of 'post_animal_bloc.dart';

abstract class PostAnimalState extends Equatable {
  const PostAnimalState();

  @override
  List<Object> get props => [];
}

class PostAnimalInitial extends PostAnimalState {}

class PostAnimalLoading extends PostAnimalState {}

class PostAnimalError extends PostAnimalState {}

class PostAnimalDone extends PostAnimalState {
  const PostAnimalDone({
    required this.id,
  });
  final String id;
}
