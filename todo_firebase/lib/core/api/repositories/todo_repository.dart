import 'package:dartz/dartz.dart';
import 'package:todo_firebase/core/api/entities/todo.dart';
import 'package:todo_firebase/core/api/failures/todo_failure.dart';

abstract class TodoRepository {
  Stream<Either<TodoFailure, List<Todo>>> watchAll();

  Future<Either<TodoFailure,Unit>> create(Todo todo);

  
  Future<Either<TodoFailure,Unit>> update(Todo todo);


  Future<Either<TodoFailure,Unit>> delete(Todo todo);
}
