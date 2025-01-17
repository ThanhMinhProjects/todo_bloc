part of 'task_bloc.dart';

class TaskState extends Equatable {
  final bool isLoading;
  final List<TaskEntity>? tasks;
  final TaskEntity? task;

  const TaskState({
    this.task,
    this.isLoading = false,
    this.tasks = const [],
  });

  TaskState copyWith({
    bool? isLoading,
    List<TaskEntity>? tasks,
    TaskEntity? task,
  }) {
    return TaskState(
        isLoading: isLoading ?? this.isLoading,
        tasks: tasks ?? this.tasks,
        task:task ?? this.task);
  }

  @override
  List<Object?> get props => [
        isLoading,
        task,
        tasks,
      ];
}
