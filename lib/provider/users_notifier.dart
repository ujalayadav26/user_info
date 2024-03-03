import 'package:riverpod/riverpod.dart';
import 'package:usersapp/model/users_model.dart';
import 'package:usersapp/provider/users_state.dart';
import 'package:usersapp/repo/users_repo.dart';

final usersProvider = StateNotifierProvider<UsersNotifier, UsersState>(
      (ref) => UsersNotifier(),
);

class UsersNotifier extends StateNotifier<UsersState> {
  UsersRepo usersRepo = UsersRepo();
  UsersNotifier() : super(UsersState.initial()) {
    getUsersdata();
  }

  void getUsersdata() async {
    state = state.copyWith(usersStatus: UsersStatus.loading,  );

    try {
      UsersModel usersModel = await usersRepo.getAllUsersdata();

      state = state.copyWith(
        usersStatus: UsersStatus.loaded,
        usersModel: usersModel,
      );
    } catch (e) {
      state = state.copyWith(
        usersStatus: UsersStatus.error,  // Fix the typo here
        error: e.toString(),
      );
    }
  }
}


