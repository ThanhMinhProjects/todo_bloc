import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_bloc/core/error/failures.dart';
import 'package:todo_bloc/core/services/auth_service.dart';
import 'package:todo_bloc/core/services/body/login_body.dart';
import 'package:todo_bloc/features/login/domain/repositories/login_repository.dart';

@LazySingleton(as: LoginRepository)
class LoginRepositoryImpl implements LoginRepository {
  final AuthService _authService;

  LoginRepositoryImpl(this._authService);
  @override
  Future<Either<Failure, Map<String, dynamic>>> login(LoginBody body) async {
    return await _authService.login(body);
  }
}
