class ForgotPasswordBody {
  final String email;
  final String password;
  final String code;

  ForgotPasswordBody(
      {required this.email, required this.password, required this.code});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'code': code,
    };
  }
}
