part of 'auth_bloc.dart';

@immutable
abstract class AuthblocEvent {}

class RegisterWithEmailAndPassword extends AuthblocEvent {
  final String? email;
  final String? password;
  RegisterWithEmailAndPassword({required this.email, required this.password,});
}

class SignInWithEmailAndPassword extends AuthblocEvent {
  final String? email;
  final String? password;
  SignInWithEmailAndPassword({required this.email, required this.password,});
}
