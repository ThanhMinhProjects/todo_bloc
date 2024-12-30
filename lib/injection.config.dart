// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:todo_bloc/features/todo/data/repositories/todo_repository_impl.dart'
    as _i568;
import 'package:todo_bloc/features/todo/domain/repositories/todo_repository.dart'
    as _i612;
import 'package:todo_bloc/features/todo/domain/usecases/add_todo_usecase.dart'
    as _i77;
import 'package:todo_bloc/features/todo/domain/usecases/get_todos_usecase.dart'
    as _i634;
import 'package:todo_bloc/features/todo/domain/usecases/remove_todo_usecase.dart'
    as _i456;
import 'package:todo_bloc/features/todo/presentation/bloc/todo_bloc.dart'
    as _i1034;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i612.TodoRepository>(() => _i568.TodoRepositoryImpl());
    gh.factory<_i77.AddTodoUsecase>(
        () => _i77.AddTodoUsecase(gh<_i612.TodoRepository>()));
    gh.factory<_i634.GetTodosUsecase>(
        () => _i634.GetTodosUsecase(gh<_i612.TodoRepository>()));
    gh.factory<_i456.RemoveTodoUsecase>(
        () => _i456.RemoveTodoUsecase(gh<_i612.TodoRepository>()));
    gh.factory<_i1034.TodoBloc>(() => _i1034.TodoBloc(
          getTodosUsecase: gh<_i634.GetTodosUsecase>(),
          addTodoUsecase: gh<_i77.AddTodoUsecase>(),
          removeTodoUsecase: gh<_i456.RemoveTodoUsecase>(),
        ));
    return this;
  }
}
