part of global;

abstract class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

class UsersInitial extends UsersState {}

class UsersLoading extends UsersState {}

class UsersLoadedState extends UsersState {
  final List<UsersModel> patients;
  const UsersLoadedState(
    this.patients,
  );
  @override
  List<Object> get props => [patients];
}
class IndividualUserLoaded extends UsersState {
  final UsersModel user;
  const IndividualUserLoaded(
    this.user,
  );
  @override
  List<Object> get props => [user];
}

class UsersFailed extends UsersState {
  final String message;
  const UsersFailed(
    this.message,
  );
  @override
  List<Object> get props => [message];
}

class AddUserSuccess extends UsersState {
  final String message;
  const AddUserSuccess(
    this.message,
  );
  @override
  List<Object> get props => [message];
}
class UpdateUserSuccess extends UsersState {
  final String message;
  const UpdateUserSuccess(
    this.message,
  );
  @override
  List<Object> get props => [message];
}
class DeleteUserSuccess extends UsersState {
  final String message;
  const DeleteUserSuccess(
    this.message,
  );
  @override
  List<Object> get props => [message];
}
