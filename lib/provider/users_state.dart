import 'package:usersapp/model/users_model.dart';

enum UsersStatus {
  initial,
  loading,
  loaded,
  error
}

class UsersState {
  UsersStatus? usersStatus;
  UsersModel? usersModel;
  String? error;

  UsersState({
    required this.usersStatus,
    required this.usersModel,
    required this.error,
  });

  factory UsersState.initial() {
    return UsersState(
      usersStatus: UsersStatus.initial,
      usersModel: null,
      error: "",
    );
  }

  UsersState copyWith({
    UsersStatus? usersStatus,
    UsersModel? usersModel,
    String? error,
  }) {
    return UsersState(
      usersStatus: usersStatus ?? this.usersStatus,
      usersModel: usersModel ?? this.usersModel,
      error: error ?? this.error,
    );
  }

}
