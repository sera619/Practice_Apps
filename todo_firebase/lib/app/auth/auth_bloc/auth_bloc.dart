import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthblocEvent, AuthState> {
  AuthBloc() : super(AuthState(isSubmitting: false, showValidationMessages: false)) {
    on<RegisterWithEmailAndPassword>((event, emit) {
      if(event.email == null || event.password == null) {
        emit(state.copyWith(isSubbitting: false, showValidationMessages: true));
      } else {
        emit(AuthState(showValidationMessages: false, isSubmitting: true));
      }


    });

    on<SignInWithEmailAndPassword>((event, emit) {
      if (event.email == null || event.password == null){
        emit(AuthState(showValidationMessages: true, isSubmitting: false));

      } else {
        emit(AuthState(showValidationMessages: false, isSubmitting: true));
      
      
      }
      

    });
  }
}
