import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_firebase/app/auth/injection/injection.dart';
import 'package:todo_firebase/core/api/errors/errors.dart';
import 'package:todo_firebase/core/api/repositories/auth_repository.dart';

extension FirestoreExt on FirebaseFirestore {
  
  
  Future<DocumentReference> userDocument() async {
    final userOption = sl<AuthRepository>().getSignedInUser();
    final user = userOption.getOrElse(() => throw NotAuthenticatedError());
    return FirebaseFirestore.instance.collection('users').doc(user.id.value);
  }
}



extension DocumentReferceExt on DocumentReference {
  CollectionReference<Map<String,dynamic>> get todoCollection => collection('todos');
}