import 'package:todo_bloc/core/services/body/send_otp_body.dart';
import 'package:todo_bloc/features/register/domain/repositories/register_repository.dart';

class SendOtpUsecase {
  final RegisterRepository _registerRepository;

  SendOtpUsecase(this._registerRepository);

  Future<String> call(SendOtpBody body) async {
    return await _registerRepository.sendOtp(body);
  }
}
