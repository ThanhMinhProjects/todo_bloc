import 'package:injectable/injectable.dart';
import 'package:todo_bloc/features/todo/domain/repositories/todo_repository.dart';

@injectable
class RemoveTodoUsecase {
  final TodoRepository repository;

  RemoveTodoUsecase(this.repository);

  Future<void> call(String id) {
    return repository.removeTodo(id);
  }
}
