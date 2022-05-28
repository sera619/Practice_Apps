part of 'signupform_bloc.dart';

@immutable
abstract class SignupformEvent {}

class SignupWithEmailAndPassword extends SignupformEvent {
  final String? email;
  final String? password;
  SignupWithEmailAndPassword({required this.email, required this.password,});
}

class RegisterWithEmailAndPassword extends SignupformEvent {
  final String? email;
  final String? password;
  RegisterWithEmailAndPassword({required this.email, required this.password,});
}