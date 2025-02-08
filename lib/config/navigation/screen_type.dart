import 'package:flutter/material.dart';
import 'package:todo_bloc/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:todo_bloc/features/auth/presentation/screens/login_screen.dart';
import 'package:todo_bloc/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:todo_bloc/features/auth/presentation/screens/register_screen.dart';
import 'package:todo_bloc/features/chat_bot/presentation/screens/chat_bot_screen.dart';
import 'package:todo_bloc/features/main/presentation/screen/main_screen.dart';
import 'package:todo_bloc/features/task/presentation/screens/create_task_screen.dart';
import 'package:todo_bloc/features/task/presentation/screens/task_detail_screen.dart';
import 'package:todo_bloc/features/task/presentation/screens/task_screen.dart';
import 'package:todo_bloc/features/task/presentation/screens/task_update_screen.dart';

enum ScreenType {
  login,
  register,
  forgotPassword,
  main,
  task,
  chatBot,
  projects,
  calendar,
  team,
  notifications,
  reports,
  settings,
  help,
  addTask,
  taskDetail,
  taskUpdate
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
      case ScreenType.main:
        return MainScreen();
      case ScreenType.task:
        return const TodoScreen();
      case ScreenType.chatBot:
        return ChatBotScreen();
      case ScreenType.projects:
        return const Center(child: Text('Projects'));
      case ScreenType.calendar:
        return const Center(child: Text('Calendar'));
      case ScreenType.team:
        return const Center(child: Text('Team/Users'));
      case ScreenType.notifications:
        return const Center(child: Text('Notifications'));
      case ScreenType.reports:
        return const Center(child: Text('Reports'));
      case ScreenType.settings:
        return const Center(child: Text('Settings'));
      case ScreenType.help:
        return const Center(child: Text('Help/Support'));
      case ScreenType.addTask:
        return const CreateTaskScreen();
      case ScreenType.taskDetail:
        return TaskDetailScreens(id: arguments);
      case ScreenType.taskUpdate:
        return TaskUpdateScreen(task: arguments);
      default:
        return const Center(child: Text('Page not found'));
    }
  }
}
