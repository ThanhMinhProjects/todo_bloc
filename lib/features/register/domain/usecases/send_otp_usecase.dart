import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_bloc/core/error/failures.dart';
import 'package:todo_bloc/core/services/body/send_otp_body.dart';
import 'package:todo_bloc/features/register/domain/repositories/register_repository.dart';

@Injectable()
class SendOtpUsecase {
  final RegisterRepository _registerRepository;

  SendOtpUsecase(this._registerRepository);

  Future<Either<Failure, Map<String, dynamic>>> call(SendOtpBody body) async {
    return await _registerRepository.sendOtp(body);
  }
}
