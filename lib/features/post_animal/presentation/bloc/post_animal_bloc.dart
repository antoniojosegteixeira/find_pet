import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'post_animal_event.dart';
part 'post_animal_state.dart';

class PostAnimalBloc extends Bloc<PostAnimalEvent, PostAnimalState> {
  String name = '';
  String species = '';
  String breed = '';
  String color = '';
  String contact = '';
  String city = '';
  String countrystate = '';
  String country = '';
  String address = '';
  String postType = '';
  PostAnimalBloc() : super(PostAnimalInitial()) {
    on<PostAnimalEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
