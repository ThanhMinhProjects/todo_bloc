import 'package:dartz/dartz.dart';
import 'package:todo_bloc/core/error/failures.dart';
import 'package:todo_bloc/core/services/body/register_body.dart';
import 'package:todo_bloc/core/services/body/send_otp_body.dart';

abstract class RegisterRepository {
  Future<Either<Failure, Map<String, dynamic>>> register(RegisterBody body);
  Future<Either<Failure, Map<String, dynamic>>> sendOtp(SendOtpBody body);
}
