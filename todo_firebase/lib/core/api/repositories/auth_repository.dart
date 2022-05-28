import 'package:dartz/dartz.dart';
import 'package:todo_firebase/core/api/failures/auth_failure.dart';

abstract class AuthRepository {
  Future<Either<AuthFailure, Unit>>registerWithEmailAndPassword({required String email, required String password});
  Future<Either<AuthFailure, Unit>>signinWithEmailAndPassword({required String email, required String password});

}
