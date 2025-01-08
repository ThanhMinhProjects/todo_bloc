import 'package:dartz/dartz.dart';
import 'package:todo_bloc/config/api/api_response.dart';
import 'package:todo_bloc/core/error/failures.dart';
import 'package:todo_bloc/core/services/body/task_body.dart';
import 'package:todo_bloc/features/todo/domain/repositories/todo_repository.dart';

class CreateTaskUsecase {
  final TodoRepository _repository;

  CreateTaskUsecase(this._repository);

  Future<Either<Failure, Map<String, dynamic>>> call(TaskBody body) async {
    return await _repository.createTask(body);
  }
}
