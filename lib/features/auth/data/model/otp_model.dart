import 'package:todo_bloc/features/auth/domain/entities/otp_entity.dart';

class OtpModel extends OtpEntity {
  OtpModel({required super.code, required super.message});
  factory OtpModel.fromJson(Map<String, dynamic> json) {
    return OtpModel(
        code: json['body'] != null ? json['body']['code'] : null,
        message: json['message']);
  }
}
