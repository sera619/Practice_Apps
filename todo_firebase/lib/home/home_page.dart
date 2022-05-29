import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_firebase/app/auth/auth_bloc/auth_bloc.dart';
import 'package:todo_firebase/app/auth/injection/injection.dart';
import 'package:todo_firebase/app/routes/router.gr.dart';
import 'package:todo_firebase/app/todos/observer_bloc/observer_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final observerBloc = sl<ObserverBloc>()..add(ObserveAllEvent());
    return MultiBlocProvider(
      providers: [
        BlocProvider<ObserverBloc>(
          create: (context) => observerBloc),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthStateUnauthenticated) {
                AutoRouter.of(context).push(const SignUpPageRoute());
              }
            },
          ),
          
    
        ],
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(icon: Icon(Icons.exit_to_app_outlined),
            onPressed: () => {
              BlocProvider.of<AuthBloc>(context).add(SignOutPressedEvent())
            },),
            title: const Text('Home Page'),
          ),
          body: const Placeholder(
            
          ),
        ),
      ),
    );
  }
}
