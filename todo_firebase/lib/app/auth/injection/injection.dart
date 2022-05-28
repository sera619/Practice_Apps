import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_firebase/app/auth/auth_bloc/auth_bloc.dart';
import 'package:todo_firebase/app/auth/signup_bloc/signupform_bloc.dart';
import 'package:todo_firebase/core/api/infrastructure/repositories/auth_repository_impl.dart';
import 'package:todo_firebase/core/api/repositories/auth_repository.dart';

final sl = GetIt.I; // serivce locator

Future<void> init() async {
  //! state management
  sl.registerFactory(() => SignupformBloc(authRepository: sl()));
  sl.registerFactory(() => AuthBloc(authRepository: sl()));
  //! repositories
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(firebaseAuth: sl()));

  //! external
  final firebaseAuth = FirebaseAuth.instance;
  sl.registerLazySingleton(() => firebaseAuth);
}
