import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_bloc/core/error/failures.dart';
import 'package:todo_bloc/core/services/body/send_otp_body.dart';
import 'package:todo_bloc/features/auth/domain/repositories/auth_repository.dart';

@Injectable()
class SendOtpUsecase {
  final AuthRepository _repository;

  SendOtpUsecase(this._repository);

  Future<Either<Failure, Map<String, dynamic>>> call(SendOtpBody body) async {
    return await _repository.sendOtp(body);
  }
}
