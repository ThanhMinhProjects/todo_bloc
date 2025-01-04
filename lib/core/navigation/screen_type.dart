import 'package:flutter/material.dart';
import 'package:todo_bloc/features/login/presentation/screens/login_screen.dart';
import 'package:todo_bloc/features/register/presentation/screens/register_screen.dart';

enum ScreenType {
  login,
  register,
}

class ScreenTypeHelper {
  static Widget getPage(ScreenType screenType,
      {Map<String, dynamic>? arguments}) {
    switch (screenType) {
      case ScreenType.login:
        return const LoginScreen();
      case ScreenType.register:
        return RegisterScreen();
    }
  }
}
