part of 'observer_bloc.dart';

@immutable
abstract class ObserverState {}

class ObserverInitial extends ObserverState {}

class ObserverLoading extends ObserverState {}

class ObserverFailure extends ObserverState {
  final TodoFailure todoFailure;
  ObserverFailure({required this.todoFailure});

}

class ObserverSuccess extends ObserverState{
  final List<TodoModel> todos;
  ObserverSuccess({required this.todos});
}