part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}

class LoadTodos extends TodoEvent {}

class AddTodo extends TodoEvent {
  final TodoModel todo;
  AddTodo(this.todo);
}

class RemoveTodo extends TodoEvent {
  final String id;
  RemoveTodo(this.id);
}
