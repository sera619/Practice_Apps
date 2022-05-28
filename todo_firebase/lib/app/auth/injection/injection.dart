import 'package:get_it/get_it.dart';
import 'package:todo_firebase/app/auth/signup_bloc/signupform_bloc.dart';

final sl = GetIt.I; // serivce locator

Future<void> init() async {
  //! state management
  sl.registerFactory(() => SignupformBloc());
}
