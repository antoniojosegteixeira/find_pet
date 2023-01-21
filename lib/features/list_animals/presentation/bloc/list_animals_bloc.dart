import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:find_pet/core/list_animals/entities/list_animals_page_entity.dart';
import 'package:find_pet/features/list_animals/domain/usecases/list_animals_usecase.dart';

part 'list_animals_event.dart';
part 'list_animals_state.dart';

class ListAnimalsBloc extends Bloc<ListAnimalsEvent, ListAnimalsState> {
  ListAnimalsBloc({required this.usecase}) : super(ListAnimalsInitial()) {
    on<ListAnimalsEvent>((event, emit) async {
      if (event is GetAnimalsList) {
        emit(ListAnimalsLoading());

        try {
          final responseOrFailure =
              await usecase.call(const ListAnimalsParams());

          responseOrFailure.fold(
            (l) => emit(
              ListAnimalsError(),
            ),
            (r) => emit(
              ListAnimalsDone(listAnimalsPage: r),
            ),
          );
        } catch (err) {
          emit(ListAnimalsError());
        }
      }
    });
  }

  final ListAnimalsUsecase usecase;
}
