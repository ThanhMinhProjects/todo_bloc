import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_bloc/config/api/api_response_mixin.dart';
import 'package:todo_bloc/core/error/failures.dart';
import 'package:todo_bloc/features/task/data/datasources/body/task_body.dart';
import 'package:todo_bloc/features/task/domain/entities/task_entity.dart';
import 'package:todo_bloc/features/task/domain/repositories/task_repository.dart';

@Injectable()
class CreateTaskUsecase {
  final TaskRepository _repository;

  CreateTaskUsecase(this._repository);

  Future<Either<Failure, TaskEntity>> call(TaskBody body) async {
    return await _repository.createTask(body);
  }
}
