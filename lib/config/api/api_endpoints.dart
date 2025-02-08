import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiUrl {
  ApiUrl._();
  static String baseUrl = dotenv.env['BASE_URL']!;
  static baseImage(String path) => '${dotenv.env['BASE_URL_IMAGE']!}/$path';

  // static final String imageUrl = 'http://206.189.150.98:3000/public/images';
  static final String register = '$baseUrl/auth/register';
  static final String sendOtp = '$baseUrl/auth/send-otp';
  static final String login = '$baseUrl/auth/login';
  static final String forgotPassword = '$baseUrl/auth/forgot-password';
  static final String changePassword = '$baseUrl/auth/change-password';
  static final String getProfile = '$baseUrl/user/get-me';
  static final String updateProfile = '$baseUrl/user/update/profile';
  static final String uploadFile = '$baseUrl/file/upload';
  static final String getListTask = '$baseUrl/task/get-list';
  static final String createTask = '$baseUrl/task/create';
  static final String getTaskDetail = '$baseUrl/task/get-detail';
  static final String updateTask = '$baseUrl/task/update';
  static final String deleteTask = '$baseUrl/task/delete';
  static final String multipleRestoreTask = '$baseUrl/task/multiple-restore';
  static final String multipleDeleteTask = '$baseUrl/task/multiple-delete';
}
