import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_bloc/core/error/failures.dart';
import 'package:todo_bloc/features/task/domain/repositories/task_repository.dart';

@Injectable()
class DeleteTaskUsecase {
  final TaskRepository _repository;

  DeleteTaskUsecase(this._repository);

  Future<Either<Failure, String>> call(String id) async {
    return await _repository.deleteTask(id);
  }
}
