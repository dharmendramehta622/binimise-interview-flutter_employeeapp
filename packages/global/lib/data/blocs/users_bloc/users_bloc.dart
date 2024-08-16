part of global;

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Users services = Users();
  UsersBloc() : super(UsersInitial()) {
    on<LoadUsers>((event, emit) async {
      try {
        emit(UsersLoading());
        final users = await services.getAllUsers();
        add(RefreshUsers(users.toList()));
      } catch (e) {
        emit(const UsersFailed('Failed to load users.'));
      }
    });
    on<LoadIndividualUser>((event, emit) async {
      try {
        emit(UsersLoading());
        final user = await services.getIndividualUser(event.user);
        emit(IndividualUserLoaded(user));
      } catch (e) {
        emit(const UsersFailed('Failed to load users.'));
      }
    });
    on<AddUser>((event, emit) async {
      try {
        emit(UsersLoading());
        final res = await services.addUsers(event.model);
        if (res.status) {
          clear();
          emit(const AddUserSuccess("User added successfully"));
        } else {
          emit(const UsersFailed('Failed to load users.'));
        }
      } catch (e) {
        emit(const UsersFailed("failed"));
      }
    });
    on<UpdateUser>((event, emit) async {
      try {
        emit(UsersLoading());
        final res = await services.updateUsers(event.model);
        if (res.status) {
          clear();
          emit(const UpdateUserSuccess("User added successfully"));
        } else {
          emit(const UsersFailed('Failed to load users.'));
        }
      } catch (e) {
        emit(const UsersFailed("failed"));
      }
    });
    on<DeleteUser>((event, emit) async {
      try {
        emit(UsersLoading());
        final res = await services.deleteUser(event.model);
        if (res.status) {
          emit(const DeleteUserSuccess("User added successfully"));
        } else {
          emit(const UsersFailed('Failed to load users.'));
        }
      } catch (e) {
        emit(const UsersFailed("failed"));
      }
    });
    on<RefreshUsers>((event, emit) async {
      emit(UsersLoadedState(event.users));
    });
  }
  void clear() {
    firstNameController.clear();
    lastNameController.clear();
    passwordController.clear();
    emailController.clear();
    phoneController.clear();
  }
}
