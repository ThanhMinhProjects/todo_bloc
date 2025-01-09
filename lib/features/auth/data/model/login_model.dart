//success
// {
//   "status_code": 200,
//   "success": true,
//   "message": "success",
//   "body": {
//     "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NzdmNjMyNjhiMjdhNWYzNDI1MGIwN2EiLCJpYXQiOjE3MzY0MDIzNDgsImV4cCI6MTczODk5NDM0OH0.Pep74ERYqhKs9ubRCTNIpMs7x0D6IWbMwaC5zykhWXI"
//   }
// }
// USER_NOT_EXIST
// {
//   "status_code": 400,
//   "success": false,
//   "message": "USER_NOT_EXIST"
// }
// WRONG_PASSWORD
// {
//   "status_code": 400,
//   "success": false,
//   "message": "WRONG_PASSWORD"
// }
import 'package:flutter/foundation.dart';
import 'package:todo_bloc/features/auth/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  LoginModel({required super.message, super.token});
  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
        message: json['message'],
        token: json['body'] != null ? json['body']['token'] : null);
  }
}
