part of 'list_animals_bloc.dart';

abstract class ListAnimalsEvent extends Equatable {
  const ListAnimalsEvent();

  @override
  List<Object> get props => [];
}

class GetAnimalsList extends ListAnimalsEvent {}
