import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_bloc/config/navigation/app_navigation.dart';
import 'package:todo_bloc/config/navigation/screen_type.dart';
import 'package:todo_bloc/features/task/data/datasources/body/task_body.dart';
import 'package:todo_bloc/features/task/domain/entities/task_entity.dart';
import 'package:todo_bloc/features/task/domain/usecases/create_task_usecase.dart';
import 'package:todo_bloc/features/task/domain/usecases/delete_task_usecase.dart';
import 'package:todo_bloc/features/task/domain/usecases/get_list_task_usecase.dart';
import 'package:todo_bloc/features/task/domain/usecases/update_task_usecase.dart';

part 'task_event.dart';
part 'task_state.dart';

@Injectable()
class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final CreateTaskUsecase createTaskUsecase;
  final GetListTaskUsecase getListTaskUsecase;
  final DeleteTaskUsecase deleteTaskUsecase;
  final UpdateTaskUsecase updateTaskUsecase;
  final AppNavigator navigator;
  TaskBloc(this.createTaskUsecase, this.getListTaskUsecase, this.navigator,
      this.deleteTaskUsecase, this.updateTaskUsecase)
      : super(const TaskState()) {
    on(onInit);
    on(onCreateTask);
    on(onUpDateTask);
    on(onDeleteTask);
  }
}

extension TaskBlocExtension on TaskBloc {
  Future<void> onInit(InitialEvent event, Emitter<TaskState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await getListTaskUsecase();
    result.fold(
      (l) {
        emit(state.copyWith(isLoading: false));
        EasyLoading.showError(l.message);
      },
      (r) {
        r.sort(
          (b, a) => a.createdAt.compareTo(b.createdAt),
        );
        emit(state.copyWith(isLoading: false, tasks: r));
      },
    );
  }

  Future<void> onCreateTask(
      CreateTaskEvent event, Emitter<TaskState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await createTaskUsecase(event.taskBody);
    result.fold(
      (l) => EasyLoading.showError(l.message),
      (r) {
        EasyLoading.showSuccess('Created new task').then(
          (_) => navigator.replace(screenType: ScreenType.task),
        );
      },
    );
  }

  Future<void> onUpDateTask(
      UpdateTaskEvent event, Emitter<TaskState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await updateTaskUsecase(event.taskBody, event.id);
    result.fold(
      (l) {
        emit(state.copyWith(isLoading: false));
        EasyLoading.showError(l.message);
      },
      (r) {
        emit(state.copyWith(isLoading: false));
        EasyLoading.showSuccess('Updated').then(
          (_) => navigator.replace(screenType: ScreenType.task),
        );
      },
    );
  }

  Future<void> onDeleteTask(
      DeleteTaskEvent event, Emitter<TaskState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await deleteTaskUsecase(event.id);
    result.fold(
      (l) {
        emit(state.copyWith(isLoading: false));
        EasyLoading.showError(l.message);
      },
      (r) {
        emit(state.copyWith(isLoading: false));
        EasyLoading.showSuccess('Delete task success')
            .then((_) => navigator.replace(screenType: ScreenType.task));
      },
    );
  }
}
