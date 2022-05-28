import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_firebase/app/auth/auth_bloc/auth_bloc.dart';
import 'package:todo_firebase/app/auth/injection/injection.dart' as di;
import 'package:todo_firebase/app/auth/injection/injection.dart';
import 'package:todo_firebase/app/routes/router.gr.dart' as r;
import 'package:todo_firebase/res/signup_page.dart';
import 'package:todo_firebase/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _approuter = r.AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
        BlocProvider(create: (context) => sl<AuthBloc>(),),
      ],
      
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'ToDo Firebase',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.dark,
        routeInformationParser: _approuter.defaultRouteParser(),
        routerDelegate: _approuter.delegate(),
      ),
    );
  }
}
