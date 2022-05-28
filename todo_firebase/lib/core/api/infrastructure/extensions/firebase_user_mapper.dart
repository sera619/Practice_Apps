import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_firebase/core/api/entities/unique_id.dart';
import 'package:todo_firebase/core/api/entities/user.dart';

extension FirebaseUserMapper on User {
  CustomUser toDomain() {
    return CustomUser(
      id: UniqueID.fromUniqueString(uid),
    );
  }
}
