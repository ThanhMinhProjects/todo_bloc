// {
//   "status_code": 200,
//   "success": true,
//   "message": "success",
//   "body": null
// }
// {
//   "status_code": 400,
//   "success": false,
//   "message": "WRONG_OTP"
// }
// {
//   "status_code": 400,
//   "success": false,
//   "message": "USER_NOT_EXIST"
// }
import 'package:todo_bloc/features/auth/domain/entities/forgot_password_entity.dart';

class ForgotPasswordModel extends ForgotPasswordEntity {
  final int statusCode;
  final bool success;
  final Map<String, dynamic>? body;

  ForgotPasswordModel(
      {required this.statusCode,
      required this.success,
      this.body,
      required super.message});

  factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordModel(
        statusCode: json['status_code'],
        success: json['success'],
        message: json['message'],
        body: json['body']);
  }
}
