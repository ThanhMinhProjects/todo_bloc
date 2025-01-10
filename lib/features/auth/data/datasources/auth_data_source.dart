import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_bloc/config/api/api_endpoints.dart';
import 'package:todo_bloc/config/api/api_response_mixin.dart';
import 'package:todo_bloc/config/api/api_service.dart';
import 'package:todo_bloc/core/error/failures.dart';
import 'package:todo_bloc/features/auth/data/datasources/body/forgot_password_body.dart';
import 'package:todo_bloc/features/auth/data/datasources/body/login_body.dart';
import 'package:todo_bloc/features/auth/data/datasources/body/register_body.dart';
import 'package:todo_bloc/features/auth/data/datasources/body/send_otp_body.dart';
import 'package:http/http.dart' as http;
import 'package:todo_bloc/features/auth/data/model/forgot_password_model.dart';
import 'package:todo_bloc/features/auth/data/model/login_model.dart';
import 'package:todo_bloc/features/auth/data/model/otp_model.dart';
import 'package:todo_bloc/features/auth/data/model/register_model.dart';

@LazySingleton()
class AuthDataSource {
  final ApiService _apiService;
  AuthDataSource(this._apiService);

  Future<Either<Failure, OtpModel>> sendOtp(SendOtpBody body) async {
    try {
      final response =
          await _apiService.postData(ApiUrl.sendOtp, body.toJson());
      return right(OtpModel.fromJson(jsonDecode(response.body)));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, RegisterModel>> register(RegisterBody body) async {
    try {
      final response = await _apiService.postData(
          ApiUrl.register, body.toJson());
      final result = RegisterModel.fromJson(jsonDecode(response.body));
      return right(result);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, LoginModel>> login(LoginBody body) async {
    try {
      final response =
          await _apiService.postData(ApiUrl.login, body.toJson());
      return right(LoginModel.fromJson(jsonDecode(response.body)));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, ForgotPasswordModel>> forgotPassword(
      ForgotPasswordBody body) async {
    try {
      final response = await _apiService.postData(
          ApiUrl.forgotPassword, body.toJson());
      return right(ForgotPasswordModel.fromJson(jsonDecode(response.body)));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
