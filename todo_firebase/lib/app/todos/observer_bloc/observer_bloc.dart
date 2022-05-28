import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:todo_firebase/core/api/entities/todo.dart';
import 'package:todo_firebase/core/api/failures/todo_failure.dart';
import 'package:todo_firebase/core/api/infrastructure/models/todo_model.dart';
import 'package:todo_firebase/core/api/repositories/todo_repository.dart';

part 'observer_event.dart';
part 'observer_state.dart';

class ObserverBloc extends Bloc<ObserverEvent, ObserverState> {
  final TodoRepository todoRepository;

  StreamSubscription<Either<TodoFailure, List<Todo>>>? _todoStreamSub;

  ObserverBloc({required this.todoRepository}) : super(ObserverInitial()) {
    on<ObserveAllEvent>((event, emit) async {
      emit(ObserverLoading());
      await _todoStreamSub?.cancel();
      _todoStreamSub = todoRepository
          .watchAll()
          .listen((failureOrTodos) => add(TodosUpdatedEvent(failureOrTodos: failureOrTodos)));
    });

    on<TodosUpdatedEvent>((event, emit) => {
          event.failureOrTodos.fold((failure) => emit(ObserverFailure(todoFailure: failure)),
              (todos) => emit(ObserverSuccess(todos: todos))),
        });
  }
}
