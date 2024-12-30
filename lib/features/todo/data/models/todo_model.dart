import 'package:todo_bloc/features/todo/domain/entities/todo.dart';

class TodoModel extends Todo {
  TodoModel({required super.id, required super.title});
  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      title: json['title'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
    };
  }
}
