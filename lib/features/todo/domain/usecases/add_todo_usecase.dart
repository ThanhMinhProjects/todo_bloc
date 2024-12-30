import 'package:injectable/injectable.dart';
import 'package:todo_bloc/features/todo/data/models/todo_model.dart';
import 'package:todo_bloc/features/todo/domain/repositories/todo_repository.dart';

@injectable
class AddTodoUsecase {
  final TodoRepository repository;

  AddTodoUsecase(this.repository);

  Future<void> call(TodoModel todoModel) async {
    return repository.addTodo(todoModel);
  }
}
