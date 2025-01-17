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

class DeleteTaskEvent extends TaskEvent {
  final String id;

  const DeleteTaskEvent(this.id);
}

class UpdateTaskEvent extends TaskEvent {
  final TaskBody taskBody;
  final String id;

  const UpdateTaskEvent(this.taskBody, this.id);
}

class GetTaskDetailEvent extends TaskEvent {
  final String id;

  const GetTaskDetailEvent(this.id);
}
