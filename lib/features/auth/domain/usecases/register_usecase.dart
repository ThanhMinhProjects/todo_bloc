import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_bloc/core/error/failures.dart';
import 'package:todo_bloc/core/services/body/register_body.dart';
import 'package:todo_bloc/features/auth/domain/repositories/auth_repository.dart';

@Injectable()
class RegisterUsecase {
  final AuthRepository _repository;

  RegisterUsecase(this._repository);

  Future<Either<Failure, Map<String, dynamic>>> call(RegisterBody body) async {
    return await _repository.register(body);
  }
}
