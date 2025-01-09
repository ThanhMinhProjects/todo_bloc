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
import 'package:todo_bloc/features/auth/data/model/login_model.dart';
import 'package:todo_bloc/features/auth/data/model/otp_model.dart';
import 'package:todo_bloc/features/auth/data/model/register_model.dart';

@LazySingleton()
class AuthService {
  final ApiService _apiService;
  AuthService(this._apiService);

  Future<Either<Failure, OtpModel>> sendOtp(SendOtpBody body) async {
    try {
      final response =
          await _apiService.postData(ApiEndpoints.endPointOtp, body.toJson());
      print('ytestttt ${response.body}');
      return right(OtpModel.fromJson(jsonDecode(response.body)));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, RegisterModel>> register(RegisterBody body) async {
    try {
      final response = await _apiService.postData(
          ApiEndpoints.endPointAuthRegister, body.toJson());
      final result = RegisterModel.fromJson(jsonDecode(response.body));
      return right(result);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, LoginModel>> login(LoginBody body) async {
    try {
      final response =
          await _apiService.postData(ApiEndpoints.endPointLogin, body.toJson());
      return right(jsonDecode(response.body));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, Map<String, dynamic>>> forgotPassword(
      ForgotPasswordBody body) async {
    try {
      final response = await _apiService.postData(
          ApiEndpoints.endPointForgotPassword, body.toJson());
      return right(jsonDecode(response.body));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
