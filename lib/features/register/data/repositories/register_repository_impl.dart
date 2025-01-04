import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_bloc/core/error/failures.dart';
import 'package:todo_bloc/core/services/auth_service.dart';
import 'package:todo_bloc/core/services/body/register_body.dart';
import 'package:todo_bloc/core/services/body/send_otp_body.dart';
import 'package:todo_bloc/features/register/domain/repositories/register_repository.dart';

@LazySingleton(as: RegisterRepository)
class RegisterRepositoryImpl implements RegisterRepository {
  final AuthService _authService;

  RegisterRepositoryImpl(this._authService);

  @override
  Future<Either<Failure, Map<String, dynamic>>> sendOtp(SendOtpBody body) {
    return _authService.sendOtp(body);
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> register(RegisterBody body) {
    return _authService.register(body);
  }
}