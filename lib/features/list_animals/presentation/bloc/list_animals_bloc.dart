import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'list_animals_event.dart';
part 'list_animals_state.dart';

class ListAnimalsBloc extends Bloc<ListAnimalsEvent, ListAnimalsState> {
  ListAnimalsBloc() : super(ListAnimalsInitial()) {
    on<ListAnimalsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
