part of staff;

class Routes {
  static String landing = '/landing';
  static String addUser = '/add-user';
  static String editUser = '/edit-user';
  static String userDetail = '/user-detail';
}

mixin GoRoutes {
  static final routes = <RouteBase>[
    GoRoute(
      name: 'initial',
      path: '/',
      builder: (context, state) => LandingScreen(),
    ),
    GoRoute(
      name: 'landing',
      path: '/landing',
      builder: (context, state) => LandingScreen(),
    ),
    GoRoute(
      name: 'add-user',
      path: '/add-user',
      builder: (context, state) => AddUserScreen(),
    ),
    GoRoute(
      name: 'user-detail',
      path: '/user-detail',
      builder: (context, state) {
              final data = state.extra as Map<String, dynamic>?;

          return UserDetailScreen(users: data?['user']);
        
      } ,
    ),
    GoRoute(
      name: 'edit-user',
      path: '/edit-user',
      builder: (context, state) {
              final data = state.extra as Map<String, dynamic>?;

          return EditUserScreen(model: data?['user']);
        
      } ,
    ),
    // GoRoute(
    //     name: 'newAssessment',
    //     path: '/new-assessment',
    //     builder: (context, state) {
    //       final assessmentType = state.extra as Map<String, dynamic>?;

    //       return NewAssessmentPage(assessmentType: assessmentType);
    //     }),
    // GoRoute(
    //     name: 'assessmentDetail',
    //     path: '/assessment-detail',
    //     builder: (context, state) {
    //       final data = state.extra  as Map<String, dynamic>;

    //       return AssessmentDetail(data: data);
    //     }),
    // GoRoute(
    //     name: 'questionnaire',
    //     path: '/questionnaire',
    //     builder: (context, state) {
    //       final data = state.extra as Map<String, dynamic>;
    //       return QuessionnairePage(
    //           questionnaire: data["questions"],
    //           assessmentBloc: data["assessmentBloc"]);
    //     }),
  ];
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static final router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: '/',
    routes: routes,
  );
}
