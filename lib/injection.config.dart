// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:todo_bloc/core/api/api_service.dart' as _i702;
import 'package:todo_bloc/core/services/auth_service.dart' as _i591;
import 'package:todo_bloc/features/register/data/repositories/register_repository_impl.dart'
    as _i722;
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
    gh.factory<_i591.AuthService>(
        () => _i591.AuthService(gh<_i702.ApiService>()));
    gh.factory<_i722.RegisterRepositoryImpl>(
        () => _i722.RegisterRepositoryImpl(gh<_i591.AuthService>()));
    gh.factory<_i503.RegisterBloc>(
        () => _i503.RegisterBloc(sendOtpUsecase: gh<_i742.SendOtpUsecase>()));
    return this;
  }
}
