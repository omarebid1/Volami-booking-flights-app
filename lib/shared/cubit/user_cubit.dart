import 'package:bloc/bloc.dart';

import '../../models/user_model.dart';
import '../../repository/user_repository.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository _userRepository;

  UserCubit(this._userRepository) : super(UserInitial());

  Future<void> fetchUser(String uid) async {
    try {
      emit(UserLoading());
      User? user = await _userRepository.getUser(uid);
      if (user != null) {
        emit(UserLoaded(user));
      } else {
        emit(UserError("User not found"));
      }
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}
