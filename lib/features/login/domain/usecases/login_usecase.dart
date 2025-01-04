import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_bloc/core/error/failures.dart';
import 'package:todo_bloc/core/services/body/login_body.dart';
import 'package:todo_bloc/core/services/body/register_body.dart';
import 'package:todo_bloc/features/login/domain/repositories/login_repository.dart';
import 'package:todo_bloc/features/register/domain/repositories/register_repository.dart';

@Injectable()
class LoginUsecase {
  final LoginRepository _loginRepository;

  LoginUsecase(this._loginRepository);

  Future<Either<Failure, Map<String, dynamic>>> call(LoginBody body) async {
    return await _loginRepository.login(body);
  }
}
