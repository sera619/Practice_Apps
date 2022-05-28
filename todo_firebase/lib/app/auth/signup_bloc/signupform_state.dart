part of 'signupform_bloc.dart';


class SignupformState {
  final bool showValidationMessages;
  final bool isSubmitting;


  SignupformState({required this.showValidationMessages, required this.isSubmitting});

  SignupformState copyWith({bool? isSubbitting, bool? showValidationMessages}) {
    return SignupformState(
      isSubmitting: isSubbitting ?? this.isSubmitting,
      showValidationMessages: showValidationMessages ?? this.showValidationMessages,
    );
  }

}


