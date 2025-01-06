import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_bloc/core/api/api_endpoints.dart';
import 'package:todo_bloc/core/api/api_service.dart';
import 'package:todo_bloc/core/error/failures.dart';
import 'package:todo_bloc/core/services/body/login_body.dart';
import 'package:todo_bloc/core/services/body/register_body.dart';
import 'package:todo_bloc/core/services/body/send_otp_body.dart';
import 'package:http/http.dart' as http;

@LazySingleton()
class AuthService {
  final ApiService _apiService;
  AuthService(this._apiService);

  Future<Either<Failure, Map<String, dynamic>>> sendOtp(
      SendOtpBody body) async {
    try {
      final response =
          await _apiService.postData(ApiEndpoints.endPointOtp, body.toJson());
      return right(response);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, Map<String, dynamic>>> register(
      RegisterBody body) async {
    try {
      final response = await _apiService.postData(
          ApiEndpoints.endPointAuthRegister, body.toJson());
      return right(response);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, Map<String, dynamic>>> login(LoginBody body) async {
    try {
      final response =
          await _apiService.postData(ApiEndpoints.endPointLogin, body.toJson());
      return right(response);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
