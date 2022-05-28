part of 'signupform_bloc.dart';


class SignupformState {
  final bool showValidationMessages;
  final bool isSubmitting;
  final Option<Either<AuthFailure, Unit>> authFailureOrSuccessOption;


  SignupformState({required this.showValidationMessages, required this.isSubmitting, required this.authFailureOrSuccessOption});

  SignupformState copyWith({bool? isSubbitting, bool? showValidationMessages, Option<Either<AuthFailure, Unit>>? authFailureOrSuccessOption}) {
    return SignupformState(
      isSubmitting: isSubbitting ?? this.isSubmitting,
      showValidationMessages: showValidationMessages ?? this.showValidationMessages,
      authFailureOrSuccessOption: authFailureOrSuccessOption ?? this.authFailureOrSuccessOption,
    );
  }

}


