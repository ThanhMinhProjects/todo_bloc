import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_bloc/config/api/api_response_mixin.dart';
import 'package:todo_bloc/core/error/failures.dart';
import 'package:todo_bloc/features/task/data/datasources/body/task_body.dart';
import 'package:todo_bloc/core/services/remote/task_service.dart';
import 'package:todo_bloc/features/task/data/datasources/task_data_source.dart';
import 'package:todo_bloc/features/task/data/model/task_model.dart';
import 'package:todo_bloc/features/task/domain/entities/task_entity.dart';
import 'package:todo_bloc/features/task/domain/repositories/task_repository.dart';

@Injectable(as: TaskRepository)
class TaskRepositoryImpl implements TaskRepository {
  final TaskDataSource _taskDataSource;

  TaskRepositoryImpl(this._taskDataSource);
  @override
  Future<Either<Failure, TaskModel>> createTask(TaskBody body) {
    return _taskDataSource.createTask(body);
  }

  @override
  Future<Either<Failure, List<TaskModel>>> getListTask() {
    return _taskDataSource.getListTask();
  }

  @override
  Future<Either<Failure, String>> deleteTask(String id) {
    return _taskDataSource.deleteTask(id);
  }

  @override
  Future<Either<Failure, TaskModel>> updateTask(TaskBody taskBody, String id) {
    return _taskDataSource.updateTask(taskBody, id);
  }
}
