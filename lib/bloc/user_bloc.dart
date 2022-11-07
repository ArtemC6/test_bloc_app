import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_bloc_app/bloc/user_event.dart';
import 'package:test_bloc_app/bloc/user_state.dart';
import 'package:test_bloc_app/services/user_repository.dart';

import '../models/user_model.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  late final UserRepository usersRepository;

  UserBloc({required this.usersRepository}) : super(UserEmptyState()) {
    on<UserLoadEvent>(
      (event, emit) async {
        emit(UserLoadingState());

        try {
          final List<User> loadedUserList = await usersRepository.getAllUsers();
          emit(UserLoadedState(loadedUser: loadedUserList));
        } catch (_) {
          emit(UserErrorState() as UserState);
        }
      },
    );
    on<UserClearEvent>(
      (event, emit) async {
        emit(UserEmptyState());
      },
    );
  }
}
