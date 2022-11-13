import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:find_pet/features/user_posts/domain/entities/user_posts_page_entity.dart';
import 'package:find_pet/features/user_posts/domain/usecases/user_posts_usecase.dart';

part 'user_posts_event.dart';
part 'user_posts_state.dart';

class UserPostsBloc extends Bloc<UserPostsEvent, UserPostsState> {
  UserPostsBloc({required this.usecase}) : super(UserPostsInitial()) {
    on<UserPostsEvent>((event, emit) async {
      if (event is GetUserAnimalList) {
        emit(UserPostsLoading());

        try {
          final responseOrFailure = await usecase.call(const UserPostsParams());

          responseOrFailure.fold(
            (l) => emit(
              UserPostsError(),
            ),
            (r) => emit(
              UserPostsDone(userPostsPage: r),
            ),
          );
        } catch (err) {
          emit(UserPostsError());
        }
      }
    });
  }

  final UserPostsUsecase usecase;
}
