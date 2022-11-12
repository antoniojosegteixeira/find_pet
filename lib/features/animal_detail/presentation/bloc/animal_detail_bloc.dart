import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:find_pet/features/animal_detail/domain/entities/animal_detail_entity.dart';
import 'package:find_pet/features/animal_detail/domain/usecases/animal_detail_usecase.dart';

part 'animal_detail_event.dart';
part 'animal_detail_state.dart';

class AnimalDetailBloc extends Bloc<AnimalDetailEvent, AnimalDetailState> {
  AnimalDetailBloc({required this.usecase}) : super(AnimalDetailInitial()) {
    on<AnimalDetailEvent>((event, emit) async {
      if (event is GetAnimalDetail) {
        emit(AnimalDetailLoading());

        try {
          final responseOrFailure =
              await usecase.call(AnimalDetailParams(id: event.id));

          responseOrFailure.fold(
            (l) => emit(
              AnimalDetailError(),
            ),
            (r) => emit(
              AnimalDetailDone(animalDetail: r),
            ),
          );
        } catch (err) {
          emit(AnimalDetailError());
        }
      }
    });
  }

  final AnimalDetailUsecase usecase;
}
