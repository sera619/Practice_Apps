part of 'auth_bloc.dart';

class AuthState {
  final bool showValidationMessages;
  final bool isSubmitting;

  AuthState({required this.isSubmitting, required this.showValidationMessages,});

  AuthState copyWith({bool? isSubbitting, bool? showValidationMessages}) {
    return AuthState(
      isSubmitting: isSubmitting ?? this.isSubmitting,
      showValidationMessages: showValidationMessages ?? this.showValidationMessages,
    );
  }
}
