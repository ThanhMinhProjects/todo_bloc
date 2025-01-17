import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_bloc/core/error/failures.dart';
import 'package:todo_bloc/features/task/domain/entities/task_entity.dart';
import 'package:todo_bloc/features/task/domain/repositories/task_repository.dart';

@Injectable()
class GetTaskDetailUsecase {
  final TaskRepository _repository;

  GetTaskDetailUsecase(this._repository);

  Future<Either<Failure, TaskEntity>> call(String id) async {
    return await _repository.getTaskDetail(id);
  }
}
