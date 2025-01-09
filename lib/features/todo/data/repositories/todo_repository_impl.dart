import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_bloc/config/api/api_response_mixin.dart';
import 'package:todo_bloc/core/error/failures.dart';
import 'package:todo_bloc/core/services/body/task_body.dart';
import 'package:todo_bloc/core/services/remote/task_service.dart';
import 'package:todo_bloc/features/todo/domain/repositories/todo_repository.dart';

@Injectable(as: TodoRepository)
class TodoRepositoryImpl implements TodoRepository {
  final TaskService _taskService;

  TodoRepositoryImpl(this._taskService);
  @override
  Future<Either<Failure, Map<String,dynamic>>> createTask(TaskBody body) {
    return _taskService.createTask(body);
  }
}
