import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:todo_bloc/features/todo/data/models/todo_model.dart';
import 'package:todo_bloc/features/todo/domain/usecases/add_todo_usecase.dart';
import 'package:todo_bloc/features/todo/domain/usecases/get_todos_usecase.dart';
import 'package:todo_bloc/features/todo/domain/usecases/remove_todo_usecase.dart';
part 'todo_event.dart';
part 'todo_state.dart';

@injectable
class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final GetTodosUsecase getTodosUsecase;
  final AddTodoUsecase addTodoUsecase;
  final RemoveTodoUsecase removeTodoUsecase;
  TodoBloc(
      {required this.getTodosUsecase,
      required this.addTodoUsecase,
      required this.removeTodoUsecase})
      : super(TodoInitial()) {
    on<LoadTodos>((event, emit) async {
      emit(IsLoading());
      try {
        final todos = await getTodosUsecase();
        emit(TodoLoaded(todos));
      } catch (e) {
        emit(TodoError(e.toString()));
      }
    });
    on<AddTodo>((event, emit) async {
      await addTodoUsecase(event.todo);
      final todos = await getTodosUsecase();
      emit(TodoLoaded(todos));
    });
    on<RemoveTodo>((event, emit) async {
      if (state is TodoLoaded) {
        await removeTodoUsecase(event.id);
        final todos = await getTodosUsecase();
        emit(TodoLoaded(todos));
      }
    });
  }
}
