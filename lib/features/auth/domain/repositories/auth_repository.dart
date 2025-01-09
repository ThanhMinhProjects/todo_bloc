import 'package:dartz/dartz.dart';
import 'package:todo_bloc/config/api/api_response_mixin.dart';
import 'package:todo_bloc/core/error/failures.dart';
import 'package:todo_bloc/features/auth/data/datasources/body/forgot_password_body.dart';
import 'package:todo_bloc/features/auth/data/datasources/body/login_body.dart';
import 'package:todo_bloc/features/auth/data/datasources/body/register_body.dart';
import 'package:todo_bloc/features/auth/data/datasources/body/send_otp_body.dart';
import 'package:todo_bloc/features/auth/data/model/otp_model.dart';
import 'package:todo_bloc/features/auth/domain/entities/login_entity.dart';
import 'package:todo_bloc/features/auth/domain/entities/otp_entity.dart';
import 'package:todo_bloc/features/auth/domain/entities/register_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, RegisterEntity>> register(RegisterBody body);
  Future<Either<Failure, OtpEntity>> sendOtp(SendOtpBody body);
  Future<Either<Failure, LoginEntity>> login(LoginBody body);
  Future<Either<Failure, Map<String, dynamic>>> forgotPassword(
      ForgotPasswordBody body);

  Future<bool> setToken(String token);
}
