import 'package:injectable/injectable.dart';
import 'package:todo_bloc/features/todo/data/models/todo_model.dart';

import '../repositories/todo_repository.dart';

@injectable
class GetTodosUsecase {
  final TodoRepository repository;

  GetTodosUsecase(this.repository);

  Future<List<TodoModel>> call() {
    return repository.getTodos();
  }
}
