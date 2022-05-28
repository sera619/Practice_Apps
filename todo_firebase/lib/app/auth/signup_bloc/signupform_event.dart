part of 'signupform_bloc.dart';

@immutable
abstract class SignupformEvent {}

class SignupWithEmailAndPasswordPressed extends SignupformEvent {
  final String? email;
  final String? password;
  SignupWithEmailAndPasswordPressed({
    required this.email,
    required this.password,
  });
}

class RegisterWithEmailAndPasswordPressed extends SignupformEvent {
  final String? email;
  final String? password;
  RegisterWithEmailAndPasswordPressed({
    required this.email,
    required this.password,
  });
}
