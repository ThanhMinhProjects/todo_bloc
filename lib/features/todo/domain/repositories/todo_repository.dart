import 'package:dartz/dartz.dart';
import 'package:todo_bloc/config/api/api_response.dart';
import 'package:todo_bloc/core/error/failures.dart';
import 'package:todo_bloc/core/services/body/task_body.dart';

abstract class TodoRepository {
  Future<Either<Failure, Map<String,dynamic>>> createTask(TaskBody body);
}
