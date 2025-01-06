import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_bloc/features/auth/presentation/screens/login_screen.dart';
import 'package:todo_bloc/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:todo_bloc/features/auth/presentation/screens/register_screen.dart';
import 'package:todo_bloc/features/todo/presentation/screens/add_todo_screen.dart';
import 'package:todo_bloc/features/todo/presentation/screens/todo_screen.dart';

enum ScreenType {
  login,
  register,
  todo,
  addTodo,
}

class ScreenTypeHelper {
  static Widget getPage(ScreenType screenType,
      {Map<String, dynamic>? arguments}) {
    switch (screenType) {
      case ScreenType.login:
        return const LoginScreen();
      case ScreenType.register:
        return RegisterScreen();
      case ScreenType.todo:
        return const TodoScreen();
      case ScreenType.addTodo:
        return const AddTodoScreen();
    }
  }
}
