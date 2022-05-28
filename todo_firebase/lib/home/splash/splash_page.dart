import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_firebase/app/auth/auth_bloc/auth_bloc.dart';
import 'package:todo_firebase/theme.dart';
import 'package:todo_firebase/app/routes/router.gr.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthStateAuthenticated) {
          context.router.replace(const HomePageRoute());
        } else if (state is AuthStateUnauthenticated) {
          context.router.replace(const SignUpPageRoute());

        }
      },
      child: Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: AppTheme.headCyan,
          ),
        ),
      ),
    );
  }
}
