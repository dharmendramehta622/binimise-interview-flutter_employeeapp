part of staff;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late UsersBloc _usersBloc;

  @override
  void initState() {
    super.initState();
    _usersBloc = UsersBloc()..add(LoadUsers());
  }
@override
void didChangeDependencies() {
  super.didChangeDependencies();
    context.read<UsersBloc>().add(LoadUsers());
  
}

  Future<void> _refreshAssessments() async {
    context.read<UsersBloc>().add(LoadUsers());
  }

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<UsersBloc>();
    return BlocProvider(
      create: (context) => _usersBloc,
      child: Container(
          color: kPrimary.withOpacity(.8),
          child: SafeArea(
              child: Scaffold(
            backgroundColor: kBg,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: GradientShadowContainer(
              onTap: () async {
                // bloc.add(ResetState());
                final result = await context.push(Routes.addUser);
                if (result == true) {
                  _refreshAssessments();
                }
              },
              text: "+New User",
            ),
            body: RefreshIndicator(
              onRefresh: () async {
                context.read<UsersBloc>().add(LoadUsers());
                return;
              },
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  const HomePageHeader(),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        sizedBoxHeight(20),
                        HeadingWithSeeMore(
                          heading: "Recent History",
                          onTap: () {},
                        ),
                        BlocBuilder<UsersBloc, UsersState>(
                          buildWhen: (previous, current) {
                            print("previous$previous");
                            print("current$current");
                            return (current is! AddUserSuccess ||
                                current is! DeleteUserSuccess ||
                                current is! IndividualUserLoaded);
                          },
                          builder: (context, state) {
                            print(state);
                            if (state is UsersLoading) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else if (state is UsersLoadedState) {
                              if (state.patients.isEmpty) {
                                Center(
                                  child:
                                      BoldText("No history found", 14, kBlack),
                                );
                              }
                              return ListView.separated(
                                separatorBuilder: (context, index) {
                                  return sizedBoxHeight(12);
                                },
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: state.patients.length,
                                itemBuilder: (context, index) {
                                  final users = state.patients[index];

                                  return ReportCard(users: users);
                                },
                              );
                            }

                            return const Center(
                                child: CircularProgressIndicator());
                          },
                        ),
                        sizedBoxHeight(80)
                      ],
                    ),
                  ),
                ],
              )),
            ),
          ))),
    );
  }
}
