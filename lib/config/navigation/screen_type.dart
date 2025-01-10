import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_bloc/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:todo_bloc/features/auth/presentation/screens/login_screen.dart';
import 'package:todo_bloc/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:todo_bloc/features/auth/presentation/screens/register_screen.dart';
import 'package:todo_bloc/features/task/presentation/screens/create_task_screen.dart';
import 'package:todo_bloc/features/task/presentation/screens/task_detail_screen.dart';
import 'package:todo_bloc/features/task/presentation/screens/task_screen.dart';

enum ScreenType {
  login,
  register,
  forgotPassword,
  task,
  addTask,
  taskDetail,
}

class ScreenTypeHelper {
  static Widget getPage(ScreenType screenType, {dynamic arguments}) {
    switch (screenType) {
      case ScreenType.login:
        return LoginScreen(email: arguments);
      case ScreenType.register:
        return RegisterScreen();
      case ScreenType.forgotPassword:
        return ForgotPasswordScreen();
      case ScreenType.task:
        return const TodoScreen();
      case ScreenType.addTask:
        return const CreateTaskScreen();
      case ScreenType.taskDetail:
        return TaskDetailScreens(taskEntity: arguments);
    }
  }
}
