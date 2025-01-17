class ApiUrl {
  ApiUrl._();
  static const baseUrl = 'http://206.189.150.98:3000/api/v1';
  static baseImage(String path) =>
      'http://206.189.150.98:3000/public/images/$path';

  static const imageUrl = 'http://206.189.150.98:3000/public/images';
  static const register = '$baseUrl/auth/register';
  static const sendOtp = '$baseUrl/auth/send-otp';
  static const login = '$baseUrl/auth/login';
  static const forgotPassword = '$baseUrl/auth/forgot-password';
  static const changePassword = '$baseUrl/auth/change-password';
  static const getProfile = '$baseUrl/user/get-me';
  static const updateProfile = '$baseUrl/user/update/profile';
  static const uploadFile = '$baseUrl/file/upload';
  static const getListTask = '$baseUrl/task/get-list';
  static const createTask = '$baseUrl/task/create';
  static const getTaskDetail = '$baseUrl/task/get-detail';
  static const updateTask = '$baseUrl/task/update';
  static const deleteTask = '$baseUrl/task/delete';
  static const multipleRestoreTask = '$baseUrl/task/multiple-restore';
  static const multipleDeleteTask = '$baseUrl/task/multiple-delete';
}
