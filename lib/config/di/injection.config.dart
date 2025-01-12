// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:todo_bloc/config/api/api_service.dart' as _i127;
import 'package:todo_bloc/config/di/injection.dart' as _i799;
import 'package:todo_bloc/core/services/share_pref_service.dart' as _i158;
import 'package:todo_bloc/features/app/data/repositories/app_repository_impl.dart'
    as _i208;
import 'package:todo_bloc/features/app/domain/repositories/app_repository.dart'
    as _i108;
import 'package:todo_bloc/features/app/domain/usecase/get_token_usecase.dart'
    as _i884;
import 'package:todo_bloc/features/auth/data/datasources/auth_data_source.dart'
    as _i94;
import 'package:todo_bloc/features/auth/data/repositories/auth_repository_impl.dart'
    as _i551;
import 'package:todo_bloc/features/auth/domain/repositories/auth_repository.dart'
    as _i1011;
import 'package:todo_bloc/features/auth/domain/usecases/forgot_password_usecase.dart'
    as _i669;
import 'package:todo_bloc/features/auth/domain/usecases/login_usecase.dart'
    as _i736;
import 'package:todo_bloc/features/auth/domain/usecases/register_usecase.dart'
    as _i32;
import 'package:todo_bloc/features/auth/domain/usecases/send_otp_usecase.dart'
    as _i31;
import 'package:todo_bloc/features/auth/domain/usecases/set_token_usecase.dart'
    as _i1035;
import 'package:todo_bloc/features/task/data/datasources/task_data_source.dart'
    as _i893;
import 'package:todo_bloc/features/task/data/repositories/task_repository_impl.dart'
    as _i363;
import 'package:todo_bloc/features/task/domain/repositories/task_repository.dart'
    as _i783;
import 'package:todo_bloc/features/task/domain/usecases/create_task_usecase.dart'
    as _i560;
import 'package:todo_bloc/features/task/domain/usecases/delete_task_usecase.dart'
    as _i934;
import 'package:todo_bloc/features/task/domain/usecases/get_list_task_usecase.dart'
    as _i377;
import 'package:todo_bloc/features/task/domain/usecases/update_task_usecase.dart'
    as _i856;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i158.SharePrefService>(
        () => _i158.SharePrefService(gh<_i460.SharedPreferences>()));
    gh.factory<_i127.ApiService>(
        () => _i127.ApiService(gh<_i158.SharePrefService>()));
    gh.factory<_i108.AppRepository>(
        () => _i208.AppRepositoriesImpl(gh<_i158.SharePrefService>()));
    gh.lazySingleton<_i94.AuthDataSource>(
        () => _i94.AuthDataSource(gh<_i127.ApiService>()));
    gh.lazySingleton<_i893.TaskDataSource>(
        () => _i893.TaskDataSource(gh<_i127.ApiService>()));
    gh.factory<_i884.GetTokenUsecase>(
        () => _i884.GetTokenUsecase(gh<_i108.AppRepository>()));
    gh.factory<_i783.TaskRepository>(
        () => _i363.TaskRepositoryImpl(gh<_i893.TaskDataSource>()));
    gh.lazySingleton<_i1011.AuthRepository>(() => _i551.AuthRepositoryImpl(
          gh<_i94.AuthDataSource>(),
          gh<_i158.SharePrefService>(),
        ));
    gh.factory<_i669.ForgotPasswordUsecase>(
        () => _i669.ForgotPasswordUsecase(gh<_i1011.AuthRepository>()));
    gh.factory<_i736.LoginUsecase>(
        () => _i736.LoginUsecase(gh<_i1011.AuthRepository>()));
    gh.factory<_i32.RegisterUsecase>(
        () => _i32.RegisterUsecase(gh<_i1011.AuthRepository>()));
    gh.factory<_i31.SendOtpUsecase>(
        () => _i31.SendOtpUsecase(gh<_i1011.AuthRepository>()));
    gh.factory<_i1035.SetTokenUsecase>(
        () => _i1035.SetTokenUsecase(gh<_i1011.AuthRepository>()));
    gh.factory<_i560.CreateTaskUsecase>(
        () => _i560.CreateTaskUsecase(gh<_i783.TaskRepository>()));
    gh.factory<_i934.DeleteTaskUsecase>(
        () => _i934.DeleteTaskUsecase(gh<_i783.TaskRepository>()));
    gh.factory<_i377.GetListTaskUsecase>(
        () => _i377.GetListTaskUsecase(gh<_i783.TaskRepository>()));
    gh.factory<_i856.UpdateTaskUsecase>(
        () => _i856.UpdateTaskUsecase(gh<_i783.TaskRepository>()));
    return this;
  }
}

class _$RegisterModule extends _i799.RegisterModule {}
