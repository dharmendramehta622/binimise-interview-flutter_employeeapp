part of staff;

class UserDetailScreen extends StatefulWidget {
  final UsersModel users;
  const UserDetailScreen({
    super.key,
    required this.users,
  });

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  File? file;
  @override
  void initState() {
    super.initState();
    context.read<UsersBloc>().add(LoadIndividualUser(widget.users));
    context.read<AttendanceBloc>().add(LoadAttendance(widget.users));
  }

  clear() {
    setState(() {
      file = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimary.withOpacity(.8),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: kBg,
          appBar: AppBar(
            backgroundColor: kPrimary,
            centerTitle: true,
            leading: GestureDetector(
                onTap: () {
                  context.read<UsersBloc>().add(LoadUsers());

                  context.pop();
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: kWhite,
                  weight: 18,
                  size: 25,
                )),
            elevation: 4,
            title: const Text(
              'User Detail',
              style: TextStyle(color: kWhite),
            ),
          ),
          body: BlocConsumer<UsersBloc, UsersState>(
            listener: (context, state) {
              if (state is DeleteUserSuccess) {
                showSuccessMessage(context, "User removed successfully");
                context.pop();
              }
              if (state is UpdateUserSuccess) {
                // context
                //     .read<UsersBloc>()
                //     .add(LoadIndividualUser(widget.users));
                context.read<UsersBloc>().add(LoadUsers());
              }
              if (state is IndividualUserLoaded) {
                // context.read<UsersBloc>().add(LoadUsers());
              }
              // TODO: implement listener
            },
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: kWhite,
                          borderRadius: BorderRadius.circular(8)),
                      child: BlocBuilder<UsersBloc, UsersState>(
                        buildWhen: (previous, current) {
                          if (current is UpdateUserSuccess) {
                            context
                                .read<UsersBloc>()
                                .add(LoadIndividualUser(widget.users));
                          }
                          return (current is! UpdateUserSuccess);
                        },
                        builder: (context, state) {
                          if (state is IndividualUserLoaded) {
                            return Column(
                              children: [
                                UserInfoTile("Full Name :",
                                    "${state.user.firstName} ${state.user.lastName}"),
                                UserInfoTile("email :", "${state.user.email} "),
                                UserInfoTile(
                                    "Phone no :", "${state.user.phone}"),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SemiBoldText("Actions", 17, kBlack),
                                    Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            context.push(Routes.editUser,
                                                extra: {"user": state.user});
                                          },
                                          child: const Icon(
                                            Icons.edit,
                                            color: kPurple,
                                          ),
                                        ),
                                        sizedBoxWidth(10),
                                        GestureDetector(
                                          onTap: () {
                                            context
                                                .read<UsersBloc>()
                                                .add(DeleteUser(state.user));
                                          },
                                          child: const Icon(
                                            Icons.delete,
                                            color: kPrimary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                sizedBoxHeight(12)
                              ],
                            );
                          }
                          if (state is UsersLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return Center(
                              child:
                                  BoldText("Failed to load user", 17, kBlack),
                            );
                          }
                        },
                      ),
                    ),
                    sizedBoxHeight(22),
                    Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: kWhite,
                          borderRadius: BorderRadius.circular(8)),
                      child: Column(
                        children: [
                          SemiBoldText("Add Attendance", 17, kBlack),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                child: SemiBoldText("Select Image", 17, kBlack),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  file = await showImagePicker(context);
                                  setState(() {});
                                },
                                child: Container(
                                  height: 70,
                                  width: 70,
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(0),
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(width: 1, color: kBlack)),
                                  child: file == null
                                      ? Center(
                                          child: BoldText("+", 24, kBlack),
                                        )
                                      : Image.file(
                                          file ?? File(""),
                                          height: 70,
                                          width: 70,
                                        ),
                                ),
                              )
                            ],
                          ),
                          const Gap(12),
                          GestureDetector(
                            onTap: () {
                              context.read<AttendanceBloc>().add(AddAttendance(
                                  widget.users, file ?? File("")));
                              clear();
                            },
                            child: Container(
                              color: kPrimary,
                              padding: const EdgeInsets.all(12),
                              child:
                                  SemiBoldText("Take Attendance", 15, kWhite),
                            ),
                          )
                        ],
                      ),
                    ),
                    SemiBoldText("Attendance", 22, kBlack),
                    BlocBuilder<AttendanceBloc, AttendanceState>(
                      buildWhen: (previous, current) {
                        if (current is AddAttendanceuccess) {
                          context
                              .read<AttendanceBloc>()
                              .add(LoadAttendance(widget.users));
                        }
                        return (current is! AddAttendanceuccess);
                      },
                      builder: (context, state) {
                        if (state is AttendanceLoadedState) {
                          return SizedBox(
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: state.patients.length,
                              itemBuilder: (context, index) {
                                final AttendanceModel model =
                                    state.patients[index];
                                return ResultChart(attendance: model);
                              },
                            ),
                          );
                        }
                        if (state is AttendanceLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return Center(
                            child: BoldText("Failed to load user", 17, kBlack),
                          );
                        }
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class UserInfoTile extends StatelessWidget {
  final String heading;
  final String value;
  const UserInfoTile(
    this.heading,
    this.value, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: SemiBoldText(heading, 17, kBlack)),
          Expanded(child: MediumText(value, 15, kBlack, align: TextAlign.end)),
        ],
      ),
    );
  }
}
