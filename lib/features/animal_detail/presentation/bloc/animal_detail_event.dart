part of 'animal_detail_bloc.dart';

abstract class AnimalDetailEvent extends Equatable {
  const AnimalDetailEvent();

  @override
  List<Object> get props => [];
}

class GetAnimalDetail extends AnimalDetailEvent {
  const GetAnimalDetail({required this.id});

  final String id;
}
