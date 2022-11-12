part of 'animal_detail_bloc.dart';

abstract class AnimalDetailState extends Equatable {
  const AnimalDetailState();

  @override
  List<Object> get props => [];
}

class AnimalDetailInitial extends AnimalDetailState {}

class AnimalDetailLoading extends AnimalDetailState {}

class AnimalDetailDone extends AnimalDetailState {
  const AnimalDetailDone({required this.animalDetail});

  final AnimalDetailEntity animalDetail;
}

class AnimalDetailError extends AnimalDetailState {}
