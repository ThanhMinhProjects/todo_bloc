import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_bloc/core/error/failures.dart';
import 'package:todo_bloc/features/task/data/model/task_model.dart';
import 'package:todo_bloc/features/task/domain/entities/task_entity.dart';
import 'package:todo_bloc/features/task/domain/repositories/task_repository.dart';

@Injectable()
class GetListTaskUsecase {
  final TaskRepository _repository;

  GetListTaskUsecase(this._repository);
  Future<Either<Failure, List<TaskEntity>>> call() async {
    return await _repository.getListTask();
  }
}
