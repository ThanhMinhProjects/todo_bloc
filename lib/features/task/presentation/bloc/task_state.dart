part of 'task_bloc.dart';

class TaskState extends Equatable {
  final bool isLoading;
  final List<TaskEntity> task;

  const TaskState({
    this.isLoading = false,
    this.task = const [],
  });

  TaskState copyWith({
    bool? isLoading,
    List<TaskEntity>? tasks,
  }) {
    return TaskState(
      isLoading: isLoading ?? this.isLoading,
      task: tasks ?? this.task,
    );
  }

  @override
  List<Object> get props => [isLoading, task];
}
