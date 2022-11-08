part of 'list_animals_bloc.dart';

abstract class ListAnimalsState extends Equatable {
  const ListAnimalsState();
  
  @override
  List<Object> get props => [];
}

class ListAnimalsInitial extends ListAnimalsState {}
