import 'dart:convert';





class TodoModel {
  final String id;
  final String title;
  final String body;
  final bool done;
  final int color;
  final dynamic serverTimeStamp;
  TodoModel({
    required this.id,
    required this.title,
    required this.body,
    required this.done,
    required this.color,
    required this.serverTimeStamp});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'done': done,
      'color': color,
      'serverTimeStamp': serverTimeStamp,
    };
  }
  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: "",
      title: map['title'] as String,
      body: map['body'] as String,
      done: map['done'] as bool,
      color: map['color'] as int,
      serverTimeStamp: map['serverTimeStamp'],
    );
  }

  TodoModel copyWith({
    String? id,
    String? title,
    String? body,
    bool? done,
    int? color,
    dynamic? serverTimeStamp,

  }){
    return TodoModel(id: id?? this.id, title: title ?? this.title, body: body?? this.body, done: done?? this.done, color: color?? this.color, serverTimeStamp: serverTimeStamp?? this.serverTimeStamp);
  }

}