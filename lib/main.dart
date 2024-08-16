import 'package:flutter/material.dart';
import 'package:staffapp/app.dart';
import 'package:global/global.dart';

void main() {
 runApp(
    MultiBlocProvider(providers: [
    
      BlocProvider<UsersBloc>(
        create: (context) => UsersBloc()..add(LoadUsers()),
      ),
      BlocProvider<AttendanceBloc>(
        create: (context) => AttendanceBloc(),
      ),
    ], child: const MyApp()),
  );
}


