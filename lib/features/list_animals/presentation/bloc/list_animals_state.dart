part of 'list_animals_bloc.dart';

abstract class ListAnimalsState extends Equatable {
  const ListAnimalsState();

  @override
  List<Object> get props => [];
}

class ListAnimalsInitial extends ListAnimalsState {}

class ListAnimalsLoading extends ListAnimalsState {}

class ListAnimalsDone extends ListAnimalsState {
  const ListAnimalsDone({required this.listAnimalsPage});

  final ListAnimalsPageEntity listAnimalsPage;
}

class ListAnimalsError extends ListAnimalsState {}
