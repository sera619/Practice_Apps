import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_firebase/core/api/repositories/auth_repository.dart';

part 'signupform_event.dart';
part 'signupform_state.dart';

class SignupformBloc extends Bloc<SignupformEvent, SignupformState> {
  final AuthRepository authRepository;
  SignupformBloc({required this.authRepository}) : super(SignupformState(showValidationMessages: false, isSubmitting: false)) {
    on<RegisterWithEmailAndPasswordPressed>((event, emit) {
      if (event.email == null || event.password == null) {
        emit(state.copyWith(isSubbitting: false, showValidationMessages: true));
      } else {
        emit(SignupformState(showValidationMessages: false, isSubmitting: true));
      }
    });
    on<SignupWithEmailAndPasswordPressed>((event, emit) {
      if (event.email == null || event.password == null) {
        emit(SignupformState(showValidationMessages: true, isSubmitting: false));
      } else {
        emit(SignupformState(showValidationMessages: false, isSubmitting: true));
      }
    });
  }
}
