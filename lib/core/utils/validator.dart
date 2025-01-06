class Validator {
  static String? isEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  static String? isEmail(String? email) {
    final emptyError = isEmpty(email);
    if (emptyError != null) return emptyError;

    final emailValid =
        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email!);
    if (!emailValid) {
      return 'Invalid email';
    }
    return null;
  }

  static String? isPassword(String? password) {
    final emptyError = isEmpty(password);
    if (emptyError != null) return emptyError;

    if (password!.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  static String? isConfirmPassword(String password, String confirmPassword) {
    final emptyError = isEmpty(confirmPassword);
    if (emptyError != null) return emptyError;

    if (password != confirmPassword) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? isOtp(String? otp) {
    final emptyError = isEmpty(otp);
    if (emptyError != null) return emptyError;

    if (otp!.length != 4) {
      return 'OTP must be 4 characters';
    }
    return null;
  }
}
