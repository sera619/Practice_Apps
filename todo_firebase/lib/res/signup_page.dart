import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_firebase/app/auth/injection/injection.dart';
import 'package:todo_firebase/app/auth/signup_bloc/signupform_bloc.dart';
import 'package:todo_firebase/res/widgets/signup_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => sl<SignupformBloc>(),
        child: SignUpForm(),
      ),
    );
  }
}
