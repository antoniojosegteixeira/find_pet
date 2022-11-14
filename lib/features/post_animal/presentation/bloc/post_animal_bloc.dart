import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:find_pet/core/error/failures.dart';
import 'package:find_pet/features/post_animal/domain/entities/post_animal_entity.dart';
import 'package:find_pet/features/post_animal/domain/usecases/post_animal_usecase.dart';

part 'post_animal_event.dart';
part 'post_animal_state.dart';

class PostAnimalBloc extends Bloc<PostAnimalEvent, PostAnimalState> {
  String name = '';
  String? species;
  String breed = '';
  String? sex;
  String? age;
  String color = '';
  String contact = '';
  String city = '';
  String? countrystate;
  String country = '';
  String? address;
  String? postType;
  List<File> imageFiles = [];
  PostAnimalBloc({
    required this.usecase,
  }) : super(PostAnimalInitial()) {
    on<PostAnimalEvent>(
      (event, emit) async {
        if (event is PostAnimal) {
          emit(PostAnimalLoading());

          try {
            final Either<Failure, PostAnimalEntity> failureOrPostAnimal =
                await usecase.call(
              PostAnimalParams(
                name: name,
                species: species as String,
                breed: breed,
                sex: sex ?? '',
                age: age,
                color: color,
                contact: contact,
                city: city,
                countrystate: countrystate as String,
                address: address as String,
                postType: postType == 'Encontrei um animal' ? 'found' : 'lost',
              ),
            );

            failureOrPostAnimal.fold((l) {
              emit(PostAnimalError());
            }, (r) {
              emit(PostAnimalDone(
                id: r.id,
              ));
            });
          } catch (err) {
            emit(PostAnimalError());
          }
        }
      },
    );
  }

  final PostAnimalUseCase usecase;
}
