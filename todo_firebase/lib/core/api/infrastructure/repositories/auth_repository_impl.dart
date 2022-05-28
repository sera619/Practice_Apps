import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_firebase/core/api/failures/auth_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:todo_firebase/core/api/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth firebaseAuth;

  AuthRepositoryImpl({required this.firebaseAuth});

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code =='email-already-in-use') {
        return left(EmailAlreadyInUseFailure());
      } else {
        return left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signinWithEmailAndPassword(
      {required String email, required String password}) async {
            try {
      await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      if (e.code =='wrong-password' || e.code == 'user-not-found') {
        return left(InvalidEmailAndPassCombFailure());
      } else {
        return left(ServerFailure());
      }
    }
  }
}
