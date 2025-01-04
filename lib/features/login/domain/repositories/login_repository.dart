import 'package:dartz/dartz.dart';
import 'package:todo_bloc/core/error/failures.dart';
import 'package:todo_bloc/core/services/body/login_body.dart';

abstract class LoginRepository {
  Future<Either<Failure, Map<String, dynamic>>> login(LoginBody body);
}
