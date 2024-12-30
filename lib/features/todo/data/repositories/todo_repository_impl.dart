import 'package:injectable/injectable.dart';
import 'package:todo_bloc/features/todo/data/models/todo_model.dart';
import 'package:todo_bloc/features/todo/domain/repositories/todo_repository.dart';

// lib/features/todo/data/repositories/todo_repository_impl.dart
@Injectable(as: TodoRepository)
class TodoRepositoryImpl implements TodoRepository {
  final List<TodoModel> _todoList = [];

  @override
  Future<List<TodoModel>> getTodos() async {
    print(
        "Current Todo List: $_todoList"); // Thêm dòng này để kiểm tra danh sách
    return _todoList;
  }

  @override
  Future<void> addTodo(TodoModel todo) async {
    _todoList.add(todo);
    print("Added Todo: $todo"); // Thêm dòng này để kiểm tra task đã thêm
  }

  @override
  Future<void> removeTodo(String id) async {
    _todoList.removeWhere((todo) => todo.id == id);
    print("Removed Todo with ID: $id"); // Thêm dòng này để kiểm tra task đã xóa
  }
}
