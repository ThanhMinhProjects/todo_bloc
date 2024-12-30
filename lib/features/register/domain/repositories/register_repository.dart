import 'package:todo_bloc/core/services/body/register_body.dart';
import 'package:todo_bloc/core/services/body/send_otp_body.dart';

abstract class RegisterRepository {
  Future<String> register(RegisterBody body);
  Future<String> sendOtp(SendOtpBody body);
}
