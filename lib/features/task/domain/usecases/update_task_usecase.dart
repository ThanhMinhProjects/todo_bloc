import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_bloc/core/error/failures.dart';
import 'package:todo_bloc/features/task/data/datasources/body/task_body.dart';
import 'package:todo_bloc/features/task/domain/entities/task_entity.dart';
import 'package:todo_bloc/features/task/domain/repositories/task_repository.dart';

@Injectable()
class UpdateTaskUsecase {
  final TaskRepository _repository;

  UpdateTaskUsecase(this._repository);

  Future<Either<Failure, TaskEntity>> call(TaskBody taskBody, String id) async {
    return await _repository.updateTask(taskBody, id);
  }
}
