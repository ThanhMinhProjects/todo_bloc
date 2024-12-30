import 'package:todo_bloc/core/services/auth_service.dart';
import 'package:todo_bloc/core/services/body/register_body.dart';
import 'package:todo_bloc/core/services/body/send_otp_body.dart';
import 'package:todo_bloc/features/register/domain/repositories/register_repository.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final AuthService _authService = AuthService();
  @override
  Future<String> register(RegisterBody body) async {
    final response = await _authService.register(body);
    return response.fold((l) => l.message, (r) => r);
  }

  @override
  Future<String> sendOtp(SendOtpBody body) async {
    final response = await _authService.sendOtp(body);
    return response.fold((l) => l.message, (r) => r);
  }
}
