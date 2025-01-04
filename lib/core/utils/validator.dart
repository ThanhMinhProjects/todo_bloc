class Validator {
  static String? isEmpty(String? value) {
    if (value!.isEmpty) {
      return 'This field is required';
    }
    return '';
  }

  static String? isEmail(String? email) {
    isEmpty(email);
    bool emailValid =
        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email!);
    if (!emailValid) {
      return 'Invalid email';
    }
    return '';
  }

  static String? isPassword(String? password) {
    isEmpty(password);
    if (password!.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return '';
  }

  static String isConfirmPassword(String password, String confirmPassword) {
    isEmpty(confirmPassword);
    if (password != confirmPassword) {
      return 'Password does not match';
    }
    return '';
  }

  static String? isOtp(String? otp) {
    isEmpty(otp);
    if (otp!.length != 4) {
      return 'OTP must be 4 characters';
    }
    return '';
  }
}
