// ignore_for_file: public_member_api_docs, sort_constructors_first
part of global;

abstract class UsersEvent extends Equatable {
  const UsersEvent();

  @override
  List<Object> get props => [];
}

class LoadUsers extends UsersEvent {
  
}
class UsersRefreshed extends UsersEvent {
 
}

class RefreshUsers extends UsersEvent {
 final List<UsersModel> users;
  const RefreshUsers(
     this.users,
  );
  @override
  List<Object> get props => [users];
}
class LoadIndividualUser extends UsersEvent {
 final UsersModel user;
  const LoadIndividualUser(
     this.user,
  );
  @override
  List<Object> get props => [user];
}
class AddUser extends UsersEvent {
 final UsersModel model;
  const AddUser(
     this.model,
  );
  @override
  List<Object> get props => [model];
}
class UpdateUser extends UsersEvent {
 final UsersModel model;
  const UpdateUser(
     this.model,
  );
  @override
  List<Object> get props => [model];
}
class DeleteUser extends UsersEvent {
 final UsersModel model;
  const DeleteUser(
     this.model,
  );
  @override
  List<Object> get props => [model];
}
