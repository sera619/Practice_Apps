import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_firebase/core/api/failures/todo_failure.dart';
import 'package:todo_firebase/core/api/entities/todo.dart';
import 'package:dartz/dartz.dart';
import 'package:todo_firebase/core/api/infrastructure/extensions/firebase_helpers.dart';
import 'package:todo_firebase/core/api/infrastructure/models/todo_model.dart';
import 'package:todo_firebase/core/api/repositories/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final FirebaseFirestore firestore;
  TodoRepositoryImpl({required this.firestore});
  @override
  Future<Either<TodoFailure, Unit>> create(Todo todo) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<Either<TodoFailure, Unit>> delete(Todo todo) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Either<TodoFailure, Unit>> update(Todo todo) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Stream<Either<TodoFailure, List<Todo>>> watchAll() async* {
    final userDoc = await firestore.userDocument();

    yield* userDoc.todoCollection
        .snapshots()
        .map((snapshot) => right<TodoFailure, List<Todo>>(
            snapshot.docs.map((doc) => TodoModel.fromFirestore(doc).toDomain()).toList()))
        .handleError((e) {
      if (e is FirebaseException) {
        if (e.code.contains('permission-denied') || e.code.contains("PERMISSION_DENIED")) {
          return left(InsufficientPermissionsError());
          }else{
            return left(UnexpectedFailure());
          }
      }
    });
  }
}
