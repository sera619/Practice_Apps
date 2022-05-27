import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_firebase/app/auth/auth_bloc/auth_bloc.dart';
import 'package:todo_firebase/app/auth/injection/injection.dart';
import 'package:todo_firebase/res/widgets/signup_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          centerTitle: true,
          title: Text('ToDo FireBase', style: Theme.of(context).textTheme.headline1)),
      body: BlocProvider(
        create: (context) => sl<AuthBloc>(),
        child: SignUpForm(),
      ),
    );
  }
}
