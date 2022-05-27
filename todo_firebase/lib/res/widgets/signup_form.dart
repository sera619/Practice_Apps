import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_firebase/app/auth/auth_bloc/auth_bloc.dart';
import 'package:todo_firebase/res/widgets/custombtn.dart';
import 'package:todo_firebase/theme.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    late String _email;
    late String _password;
    String? validateEmail(String? input) {
      const EmailRegex = r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
      if (input == null || input.isEmpty) {
        return 'Email is required';
      } else if (RegExp(EmailRegex).hasMatch(input)) {
        _email = input;
        return null;
      } else {
        return 'Email is invalid';
      }
    }

    String? validatePassword(String? input) {
      const PasswordRegex =
          r"""^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$""";
      if (input == null || input.isEmpty) {
        return 'Password is required';
      } else if (RegExp(PasswordRegex).hasMatch(input)) {
        _password = input;
        return null;
      } else {
        return 'Password is invalid! Min 8 chars, 1 uppercase,\n1 lowercase, 1 number and 1 special char!';
      }
    }

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        // TODO: navigate to another page (homepage) if auth is successfully
        // TODO: show error message if not
      },
      builder: (context, state) {
        return Form(
            autovalidateMode:
                state.showValidationMessages ? AutovalidateMode.always : AutovalidateMode.disabled,
            key: formKey,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 35),
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text('Welcome',
                    textAlign: TextAlign.left,
                    style: themeData.textTheme.headline1!.copyWith(letterSpacing: 5)),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Please register or sign in.',
                  textAlign: TextAlign.left,
                  style: themeData.textTheme.bodyText2,
                ),
                SizedBox(
                  height: 65,
                ),
                TextFormField(
                  cursorColor: AppTheme.headCyan,
                  validator: validateEmail,
                  //autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Nocen',
                      color: AppTheme.headCyan,
                    ),
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Nocen',
                      color: AppTheme.darkerCyan,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: themeData.colorScheme.secondary,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: AppTheme.headCyan,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //
                // PASSWORD FIELD
                TextFormField(
                  cursorColor: AppTheme.headCyan,
                  obscureText: true,
                  validator: validatePassword,
                  //autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Nocen',
                      color: AppTheme.headCyan,
                    ),
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Nocen',
                      color: AppTheme.darkerCyan,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: themeData.colorScheme.primary,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppTheme.headCyan, width: 2),
                    ),
                  ),
                ),
                if (state.isSubmitting) ...[
                  SizedBox(
                    height: 10,
                  ),
                  LinearProgressIndicator(
                    color: AppTheme.headCyan,
                  )
                ],
                SizedBox(
                  height: 20,
                ),
                CustomBTN(
                    onPressed: () => {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<AuthBloc>(context)
                            .add(SignInWithEmailAndPassword(email: _email, password: _password))
                      } else {
                        BlocProvider.of<AuthBloc>(context)
                            .add(SignInWithEmailAndPassword(email: null, password: null))
                      }
                    }, height: 40, width: 80, text: 'Sign In'),
                SizedBox(
                  height: 20,
                ),
                CustomBTN(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<AuthBloc>(context)
                            .add(RegisterWithEmailAndPassword(email: _email, password: _password));
                      } else {
                        BlocProvider.of<AuthBloc>(context)
                            .add(RegisterWithEmailAndPassword(email: null, password: null));
                      }
                    },
                    height: 40,
                    width: 80,
                    text: 'Register'),
                // make indicator invisible while state is not submitting or submitted

              ],
            ));
      },
    );
  }
}
