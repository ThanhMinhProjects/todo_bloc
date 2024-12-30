import 'package:dartz/dartz.dart';
import 'package:todo_bloc/core/api/api_endpoints.dart';
import 'package:todo_bloc/core/api/api_service.dart';
import 'package:todo_bloc/core/api/dio_client.dart';
import 'package:todo_bloc/core/error/failures.dart';
import 'package:todo_bloc/core/services/body/register_body.dart';
import 'package:todo_bloc/core/services/body/send_otp_body.dart';

class AuthService {
  final ApiService _apiService = ApiService(DioClient());
  AuthService();

  Future<Either<Failure, String>> sendOtp(SendOtpBody body) async {
    try {
      final response =
          await _apiService.post(ApiEndpoints.endPointOtp, data: body.toJson());
      return right(response.data['body']['code'].toString());
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  Future<Either<Failure, String>> register(RegisterBody body) async {
    try {
      final response = await _apiService.post(ApiEndpoints.endPointAuthRegister,
          data: body.toJson());
      return right(response.data['message']);
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
