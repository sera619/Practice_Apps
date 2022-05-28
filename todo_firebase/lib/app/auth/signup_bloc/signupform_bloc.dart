import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:todo_firebase/core/api/failures/auth_failure.dart';
import 'package:todo_firebase/core/api/repositories/auth_repository.dart';

part 'signupform_event.dart';
part 'signupform_state.dart';

class SignupformBloc extends Bloc<SignupformEvent, SignupformState> {
  final AuthRepository authRepository;
  SignupformBloc({required this.authRepository})
      : super(SignupformState(showValidationMessages: false, isSubmitting: false, authFailureOrSuccessOption: none())) {
    on<RegisterWithEmailAndPasswordPressed>((event, emit) async {
      if (event.email == null || event.password == null) {
        emit(state.copyWith(isSubbitting: false, showValidationMessages: true));
    
      } else {
        emit(state.copyWith(isSubbitting: true,showValidationMessages: false));
        final failureOrSuccess =
          await authRepository.registerWithEmailAndPassword(email: event.email!, password: event.password!);
        emit(state.copyWith(isSubbitting: false, authFailureOrSuccessOption: optionOf(failureOrSuccess)));
    
      }
    });




    on<SignupWithEmailAndPasswordPressed>((event, emit) async {
      if (event.email == null || event.password == null) {
        emit(state.copyWith(isSubbitting: false, showValidationMessages: true));


      } else {
        emit(state.copyWith(isSubbitting: true,showValidationMessages: false));
        final failureOrSuccess =
          await authRepository.signinWithEmailAndPassword(email: event.email!, password: event.password!);
        emit(state.copyWith(isSubbitting: false, authFailureOrSuccessOption: optionOf(failureOrSuccess)));
      }
    });
  }
}
