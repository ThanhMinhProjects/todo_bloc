part of 'task_bloc.dart';

@immutable
abstract class TaskEvent {
  const TaskEvent();
}

class InitialEvent extends TaskEvent {
  const InitialEvent();
}

class CreateTaskEvent extends TaskEvent {
  final TaskBody taskBody;

  const CreateTaskEvent(this.taskBody);
}
