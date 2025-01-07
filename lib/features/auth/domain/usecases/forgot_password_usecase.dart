import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_bloc/core/error/failures.dart';
import 'package:todo_bloc/core/services/body/forgot_password_body.dart';
import 'package:todo_bloc/core/services/body/send_otp_body.dart';
import 'package:todo_bloc/features/auth/domain/repositories/auth_repository.dart';

@Injectable()
class ForgotPasswordUsecase {
  final AuthRepository _repository;

  ForgotPasswordUsecase(this._repository);
  Future<Either<Failure, Map<String, dynamic>?>> call(
      ForgotPasswordBody body) async {
    return await _repository.forgotPassword(body);
  }
}
