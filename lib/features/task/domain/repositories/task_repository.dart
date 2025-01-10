import 'package:dartz/dartz.dart';
import 'package:todo_bloc/config/api/api_response_mixin.dart';
import 'package:todo_bloc/core/error/failures.dart';
import 'package:todo_bloc/features/task/data/datasources/body/task_body.dart';
import 'package:todo_bloc/features/task/domain/entities/task_entity.dart';

abstract class TaskRepository {
  Future<Either<Failure, TaskEntity>> createTask(TaskBody body);
  Future<Either<Failure, List<TaskEntity>>> getListTask();
  Future<Either<Failure, String>> deleteTask(String id);
  Future<Either<Failure, TaskEntity>> updateTask(TaskBody taskBody, String id);
}
