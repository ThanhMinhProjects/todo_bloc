import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_bloc/core/error/failures.dart';
import 'package:todo_bloc/core/services/body/forgot_password_body.dart';
import 'package:todo_bloc/core/services/local/share_pref_service.dart';
import 'package:todo_bloc/core/services/remote/auth_service.dart';
import 'package:todo_bloc/core/services/body/login_body.dart';
import 'package:todo_bloc/core/services/body/register_body.dart';
import 'package:todo_bloc/core/services/body/send_otp_body.dart';
import 'package:todo_bloc/features/auth/domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;
  final SharePrefService _prefService;

  AuthRepositoryImpl(this._authService, this._prefService);

  @override
  Future<Either<Failure, Map<String, dynamic>>> sendOtp(SendOtpBody body) {
    return _authService.sendOtp(body);
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> register(RegisterBody body) {
    return _authService.register(body);
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> login(LoginBody body) {
    return _authService.login(body);
  }

  @override
  Future<Either<Failure, Map<String, dynamic>?>> forgotPassword(
      ForgotPasswordBody body) {
    return _authService.forgotPassword(body);
  }

  @override
  Future<bool> setToken(String token) {
    return _prefService.setToken(token);
  }
}
