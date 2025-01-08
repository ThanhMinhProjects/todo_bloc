class SendOtpBody {
  final String email;

  SendOtpBody({required this.email});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
    };
  }
}
