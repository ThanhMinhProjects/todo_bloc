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
