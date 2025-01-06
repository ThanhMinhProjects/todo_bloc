import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_bloc/core/error/failures.dart';
import 'package:todo_bloc/core/services/body/login_body.dart';
import 'package:todo_bloc/features/auth/domain/repositories/auth_repository.dart';

@Injectable()
class LoginUsecase {
  final AuthRepository _repository;

  LoginUsecase(this._repository);

  Future<Either<Failure, Map<String, dynamic>>> call(LoginBody body) async {
    return await _repository.login(body);
  }
}
