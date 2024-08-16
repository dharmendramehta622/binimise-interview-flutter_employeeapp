// ignore_for_file: public_member_api_docs, sort_constructors_first
part of staff;

class EditUserScreen extends StatefulWidget {
  final UsersModel model;
  const EditUserScreen({
    super.key,
    required this.model,
  });

  @override
  State<EditUserScreen> createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  late UsersBloc _bloc;
  @override
  void initState() {
    _bloc = UsersBloc();
    _bloc.emailController.text = widget.model.email ?? "";
    _bloc.firstNameController.text = widget.model.firstName ?? "";
    _bloc.lastNameController.text = widget.model.lastName ?? "";
    _bloc.phoneController.text = widget.model.phone ?? "";
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
        if (state is UpdateUserSuccess) {
          // context.read<UsersBloc>().add(LoadUsers());

          showSuccessMessage(context, state.message);
          context.pop(Routes.userDetail);
        }
        if (state is UsersFailed) {
          showErrorMessage(context, "Failed to update user");
        }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: kWhite,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: GradientShadowContainer(
              onTap: () async {
                context.read<UsersBloc>().add(UpdateUser(UsersModel(
                    id: widget.model.id,
                    email: _bloc.emailController.text,
                    firstName: _bloc.firstNameController.text,
                    lastName: _bloc.lastNameController.text,
                    phone: _bloc.phoneController.text)));
              },
              text: "+Update",
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
                'Edit User',
                style: TextStyle(color: kWhite),
              ),
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  sizedBoxHeight(24),
                  NewTextField(
                    hintText: '',
                    title: "First Name",
                    controller: _bloc.firstNameController,
                  ),
                  NewTextField(
                    hintText: '',
                    title: 'last Name',
                    controller: _bloc.lastNameController,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Expanded(
                  //       child: NewTextField(
                  //         hintText: '',
                  //         title: "First Name",
                  //         controller: _bloc.firstNameController,
                  //       ),
                  //     ),
                  //     Expanded(
                  //       child: NewTextField(
                  //         hintText: '',
                  //         title: 'last Name',
                  //         controller: _bloc.lastNameController,
                  //       ),
                  //     )
                  //   ],
                  // ),
                  // const SizedBox(height: 4),
                  // NewTextField(
                  //   hintText: ' ',
                  //   title: 'Email ',
                  //   controller: _bloc.emailController,
                  // ),
                  // const SizedBox(height: 4),
                  // NewTextField(
                  //   hintText: '',
                  //   title: 'Phone',
                  //   isPhoneField: true,
                  //   scrollPadding: const EdgeInsets.only(bottom: 300),
                  //   controller: _bloc.phoneController,
                  // ),
                  const SizedBox(height: 4),
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
