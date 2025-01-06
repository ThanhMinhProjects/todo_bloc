import 'package:dartz/dartz.dart';
import 'package:todo_bloc/core/error/failures.dart';
import 'package:todo_bloc/core/services/body/login_body.dart';
import 'package:todo_bloc/core/services/body/register_body.dart';
import 'package:todo_bloc/core/services/body/send_otp_body.dart';

abstract class AuthRepository {
  Future<Either<Failure, Map<String, dynamic>>> register(RegisterBody body);
  Future<Either<Failure, Map<String, dynamic>>> sendOtp(SendOtpBody body);
  Future<Either<Failure, Map<String, dynamic>>> login(LoginBody body);
  Future<bool> setToken(String token);
}
