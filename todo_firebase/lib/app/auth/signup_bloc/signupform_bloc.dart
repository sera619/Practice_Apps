import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signupform_event.dart';
part 'signupform_state.dart';

class SignupformBloc extends Bloc<SignupformEvent, SignupformState> {
  SignupformBloc() : super(SignupformState(showValidationMessages: false, isSubmitting: false)) {
    on<RegisterWithEmailAndPassword>((event, emit) {
      if(event.email == null || event.password == null) {
        emit(state.copyWith(isSubbitting: false, showValidationMessages: true));
      } else {
        emit(SignupformState(showValidationMessages: false, isSubmitting: true));
      }

    });
    on<SignupWithEmailAndPassword>((event, emit) {
      if (event.email == null || event.password == null){
        emit(SignupformState(showValidationMessages: true, isSubmitting: false));

      } else {
        emit(SignupformState(showValidationMessages: false, isSubmitting: true));
      

      }

    });


  }
}
