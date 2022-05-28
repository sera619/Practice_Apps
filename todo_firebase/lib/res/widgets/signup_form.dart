import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_firebase/app/auth/signup_bloc/signupform_bloc.dart';
import 'package:todo_firebase/app/routes/router.gr.dart';
import 'package:todo_firebase/core/api/failures/auth_failure.dart';
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
      //const PasswordRegex = r"""^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$""";
      if (input == null || input.isEmpty) {
        return 'Password is required';
      } else if (input.length >= 8) {
        _password = input;
        return null;
      } else {
        return 'Password is invalid! Min 8 chars!';
      }
    }

    String mapFailureMessage(AuthFailure failure) {
      switch (failure.runtimeType) {
        case ServerFailure:
          return 'Something went wrong!';
        case EmailAlreadyInUseFailure:
          return 'Email is already in use';
        case InvalidEmailAndPassCombFailure:
          return 'Invalid email and password combination';
        default:
          return 'Something went wrong, please try again later';
      }
    }

    return BlocConsumer<SignupformBloc, SignupformState>(
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
            () => {},
            (eitherFailureOrSuccess) => eitherFailureOrSuccess.fold((failure) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.amberAccent,
                      content: Text(mapFailureMessage(failure))));
                }, (_) {
                  AutoRouter.of(context).push(const HomePageRoute());
                }));
      },
      builder: (context, state) {
        return Form(
            autovalidateMode:
                state.showValidationMessages ? AutovalidateMode.always : AutovalidateMode.disabled,
            key: formKey,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
              children: [
                const SizedBox(
                  height: 60,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Welcome',
                        textAlign: TextAlign.left,
                        style: themeData.textTheme.headline1!
                            .copyWith(letterSpacing: 5, fontSize: 36)),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Please register or sign in.',
                      textAlign: TextAlign.left,
                      style: themeData.textTheme.bodyText1!.copyWith(fontSize: 24,letterSpacing: 3),
                    ),
                  ],
                ),
                SizedBox(
                  height: 65,
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                  ],
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
                  height: 45,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomBTN(
                      onPressed: () => {
                        if (formKey.currentState!.validate())
                          {
                            BlocProvider.of<SignupformBloc>(context).add(
                                SignupWithEmailAndPasswordPressed(
                                    email: _email, password: _password))
                          }
                        else
                          {
                            BlocProvider.of<SignupformBloc>(context)
                                .add(SignupWithEmailAndPasswordPressed(email: null, password: null))
                          }
                      },
                      height: 45,
                      width: 140,
                      text: 'Sign In',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomBTN(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<SignupformBloc>(context).add(
                                RegisterWithEmailAndPasswordPressed(
                                    email: _email, password: _password));
                          } else {
                            BlocProvider.of<SignupformBloc>(context).add(
                                RegisterWithEmailAndPasswordPressed(email: null, password: null));
                          }
                        },
                        height: 45,
                        width: 140,
                        text: 'Register'),
                  ],
                ),
                // make indicator invisible while state is not submitting or submitted
              ],
            ));
      },
    );
  }
}
