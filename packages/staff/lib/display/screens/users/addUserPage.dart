part of staff;

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({
    super.key,
  });

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  late UsersBloc _bloc;
  @override
  void initState() {
    _bloc = UsersBloc();
    // TODO: implement initState
    super.initState();
  }

  DateTime? dateOfBirth = DateTime.now();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UsersBloc, UsersState>(
      listener: (context, state) {
        print("print this state$state");
        if (state is AddUserSuccess) {
          context.read<UsersBloc>().add(LoadUsers());

          showSuccessMessage(context, state.message);
          context.go(Routes.landing);
        }
        if (state is UsersFailed) {
          showErrorMessage(context, "Failed to add user");
        }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: kWhite,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: GradientShadowContainer(
              onTap: () async {
                context.read<UsersBloc>().add(AddUser(UsersModel(
                    email: _bloc.emailController.text,
                    firstName: _bloc.firstNameController.text,
                    lastName: _bloc.lastNameController.text,
                    password: _bloc.passwordController.text,
                    phone: _bloc.phoneController.text)));
              },
              text: "+Add",
            ),
            appBar: AppBar(
              backgroundColor: kPrimary,
              centerTitle: true,
              leading: GestureDetector(
                  onTap: () => context.pop(),
                  child: const Icon(
                    Icons.arrow_back,
                    color: kWhite,
                    weight: 18,
                    size: 25,
                  )),
              elevation: 4,
              title: const Text(
                'Add New User',
                style: TextStyle(color: kWhite),
              ),
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  sizedBoxHeight(24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: NewTextField(
                          hintText: '',
                          title: "First Name",
                          controller: _bloc.firstNameController,
                        ),
                      ),
                      Expanded(
                        child: NewTextField(
                          hintText: '',
                          title: 'last Name',
                          controller: _bloc.lastNameController,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 4),
                  NewTextField(
                    hintText: ' ',
                    title: 'Email ',
                    controller: _bloc.emailController,
                  ),
                  const SizedBox(height: 4),
                  NewTextField(
                    hintText: '',
                    title: 'Phone',
                    isPhoneField: true,
                    scrollPadding: const EdgeInsets.only(bottom: 300),
                    controller: _bloc.phoneController,
                  ),
                  const SizedBox(height: 4),
                  NewTextField(
                    hintText: '',
                    title: 'Password',
                    isPasswordField: true,
                    controller: _bloc.passwordController,
                  ),
                  sizedBoxHeight(200)
                ],
              ),
            ));
      },
    );
  }

  @override
  void dispose() {
    _bloc.firstNameController.dispose();
    _bloc.lastNameController.dispose();
    _bloc.passwordController.dispose();
    _bloc.emailController.dispose();
    _bloc.phoneController.dispose();
    super.dispose();
  }
}
