class ApiEndpoints {
  ApiEndpoints._();
  static const baseUrl = 'http://206.189.150.98:3000/api/v1';
  static baseImage(String path) =>
      'http://206.189.150.98:3000/public/images/$path';

  static const endPointBaseImage = 'http://206.189.150.98:3000/public/images';
  static const endPointAuthRegister = '$baseUrl/auth/register';
  static const endPointOtp = '$baseUrl/auth/send-otp';
  static const endPointLogin = '$baseUrl/auth/login';
  static const endPointForgotPassword = '$baseUrl/auth/forgot-password';
  static const endPointChangePassword = '$baseUrl/auth/change-password';
  static const endPointGetProfile = '$baseUrl/user/get-me';
  static const endPointUpdateProfile = '$baseUrl/user/update/profile';
  static const endPointUploadFile = '$baseUrl/file/upload';
  static const endPointGetListTask = '$baseUrl/task/get-list';
  static const endPointTaskCreate = '$baseUrl/task/create';
  static const endPointTaskUpdate = '$baseUrl/task/update';
  static const endPointTaskDelete = '$baseUrl/task/delete';
  static const endPointTaskMultipleRestore = '$baseUrl/task/multiple-restore';
  static const endPointTaskMultipleDelete = '$baseUrl/task/multiple-delete';
}
