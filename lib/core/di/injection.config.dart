// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i409;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:todo_bloc/core/api/api_service.dart' as _i702;
import 'package:todo_bloc/core/di/injection.dart' as _i1013;
import 'package:todo_bloc/core/navigation/app_navigation.dart' as _i214;
import 'package:todo_bloc/core/services/auth_service.dart' as _i591;
import 'package:todo_bloc/features/login/data/repositories/login_repository_impl.dart'
    as _i720;
import 'package:todo_bloc/features/login/domain/repositories/login_repository.dart'
    as _i152;
import 'package:todo_bloc/features/login/domain/usecases/login_usecase.dart'
    as _i976;
import 'package:todo_bloc/features/login/presentation/bloc/bloc/login_bloc.dart'
    as _i692;
import 'package:todo_bloc/features/register/data/repositories/register_repository_impl.dart'
    as _i722;
import 'package:todo_bloc/features/register/domain/repositories/register_repository.dart'
    as _i723;
import 'package:todo_bloc/features/register/domain/usecases/register_usecase.dart'
    as _i892;
import 'package:todo_bloc/features/register/domain/usecases/send_otp_usecase.dart'
    as _i742;
import 'package:todo_bloc/features/register/presentation/bloc/register_bloc.dart'
    as _i503;

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
    final registerModule = _$RegisterModule();
    gh.factory<_i702.ApiService>(() => _i702.ApiService());
    gh.singleton<_i409.GlobalKey<_i409.NavigatorState>>(
        () => registerModule.navigatorKey);
    gh.lazySingleton<_i591.AuthService>(
        () => _i591.AuthService(gh<_i702.ApiService>()));
    gh.lazySingleton<_i152.LoginRepository>(
        () => _i720.LoginRepositoryImpl(gh<_i591.AuthService>()));
    gh.factory<_i214.AppNavigator>(() => _i214.AppNavigator(
        navigateKey: gh<_i409.GlobalKey<_i409.NavigatorState>>()));
    gh.factory<_i976.LoginUsecase>(
        () => _i976.LoginUsecase(gh<_i152.LoginRepository>()));
    gh.lazySingleton<_i723.RegisterRepository>(
        () => _i722.RegisterRepositoryImpl(gh<_i591.AuthService>()));
    gh.factory<_i692.LoginBloc>(
        () => _i692.LoginBloc(gh<_i214.AppNavigator>()));
    gh.factory<_i892.RegisterUsecase>(
        () => _i892.RegisterUsecase(gh<_i723.RegisterRepository>()));
    gh.factory<_i742.SendOtpUsecase>(
        () => _i742.SendOtpUsecase(gh<_i723.RegisterRepository>()));
    gh.factory<_i503.RegisterBloc>(() => _i503.RegisterBloc(
          sendOtpUsecase: gh<_i742.SendOtpUsecase>(),
          registerUsecase: gh<_i892.RegisterUsecase>(),
          navigator: gh<_i214.AppNavigator>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i1013.RegisterModule {}
