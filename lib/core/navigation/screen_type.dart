import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_bloc/features/login/presentation/bloc/bloc/login_bloc.dart';
import 'package:todo_bloc/features/login/presentation/screens/login_screen.dart';
import 'package:todo_bloc/features/register/presentation/bloc/register_bloc.dart';
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
        return BlocProvider(
          create: (_) => GetIt.I<LoginBloc>(),
          child: const LoginScreen(),
        );
      case ScreenType.register:
        return BlocProvider(
          create: (_) => GetIt.I<RegisterBloc>(),
          child: RegisterScreen(),
        );
    }
  }
}
