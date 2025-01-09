import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_bloc/config/api/api_response_mixin.dart';
import 'package:todo_bloc/core/error/failures.dart';
import 'package:todo_bloc/features/auth/data/datasources/body/forgot_password_body.dart';
import 'package:todo_bloc/core/services/share_pref_service.dart';
import 'package:todo_bloc/features/auth/data/datasources/auth_data_source.dart';
import 'package:todo_bloc/features/auth/data/datasources/body/login_body.dart';
import 'package:todo_bloc/features/auth/data/datasources/body/register_body.dart';
import 'package:todo_bloc/features/auth/data/datasources/body/send_otp_body.dart';
import 'package:todo_bloc/features/auth/data/model/forgot_password_model.dart';
import 'package:todo_bloc/features/auth/data/model/login_model.dart';
import 'package:todo_bloc/features/auth/data/model/otp_model.dart';
import 'package:todo_bloc/features/auth/data/model/register_model.dart';
import 'package:todo_bloc/features/auth/domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _authDataSource;
  final SharePrefService _prefService;

  AuthRepositoryImpl(this._authDataSource, this._prefService);

  @override
  Future<Either<Failure, OtpModel>> sendOtp(SendOtpBody body) {
    return _authDataSource.sendOtp(body);
  }

  @override
  Future<Either<Failure, RegisterModel>> register(RegisterBody body) {
    return _authDataSource.register(body);
  }

  @override
  Future<Either<Failure, LoginModel>> login(LoginBody body) {
    return _authDataSource.login(body);
  }

  @override
  Future<Either<Failure, ForgotPasswordModel>> forgotPassword(
      ForgotPasswordBody body) {
    return _authDataSource.forgotPassword(body);
  }

  @override
  Future<bool> setToken(String token) {
    return _prefService.setToken(token);
  }
}
