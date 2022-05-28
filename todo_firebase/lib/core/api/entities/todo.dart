import 'package:todo_firebase/core/api/entities/todo_color.dart';
import 'package:todo_firebase/core/api/entities/unique_id.dart';

class Todo {
  final bool done;
  final UniqueID id;
  final String title;
  final String body;
  final TodoColor color;

  Todo({required this.done, required this.id, required this.body, required this.title, required this.color});

  factory Todo.empty(){
    return Todo(
      done: false,
      id: UniqueID(),
      title: '',
      body: '',
      color: TodoColor(color: TodoColor.predefinedColors[5]),
    );
  }

  Todo copyWith({bool? done, UniqueID? id, String? title, String? body, TodoColor? color}) {
    return Todo(
      done: done ?? this.done,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      color: color ?? this.color,
    );
  }


}
