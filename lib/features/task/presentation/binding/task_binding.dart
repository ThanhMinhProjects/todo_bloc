import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_bloc/config/navigation/app_navigation.dart';
import 'package:todo_bloc/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:todo_bloc/features/auth/domain/usecases/login_usecase.dart';
import 'package:todo_bloc/features/auth/domain/usecases/register_usecase.dart';
import 'package:todo_bloc/features/auth/domain/usecases/send_otp_usecase.dart';
import 'package:todo_bloc/features/auth/domain/usecases/set_token_usecase.dart';
import 'package:todo_bloc/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:todo_bloc/features/task/domain/usecases/create_task_usecase.dart';
import 'package:todo_bloc/features/task/domain/usecases/delete_task_usecase.dart';
import 'package:todo_bloc/features/task/domain/usecases/get_list_task_usecase.dart';
import 'package:todo_bloc/features/task/domain/usecases/update_task_usecase.dart';
import 'package:todo_bloc/features/task/presentation/bloc/task_bloc.dart';
import 'package:todo_bloc/features/task/presentation/screens/create_task_screen.dart';

class TaskBinding {
  static TaskBloc generateBloc(BuildContext context) {
    return TaskBloc(
        createTaskUsecase: GetIt.I<CreateTaskUsecase>(),
        deleteTaskUsecase: GetIt.I<DeleteTaskUsecase>(),
        getListTaskUsecase: GetIt.I<GetListTaskUsecase>(),
        updateTaskUsecase: GetIt.I<UpdateTaskUsecase>(),
        navigator: AppNavigator(context));
  }
}
