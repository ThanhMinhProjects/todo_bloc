import 'package:todo_bloc/features/todo/data/models/todo_model.dart';

abstract class TodoRepository {
  Future<List<TodoModel>> getTodos();
  Future<void> addTodo(TodoModel todoModel);
  Future<void> removeTodo(String id);
}
