import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_bloc/config/navigation/app_navigation.dart';
import 'package:todo_bloc/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:todo_bloc/features/auth/domain/usecases/login_usecase.dart';
import 'package:todo_bloc/features/auth/domain/usecases/register_usecase.dart';
import 'package:todo_bloc/features/auth/domain/usecases/send_otp_usecase.dart';
import 'package:todo_bloc/features/auth/domain/usecases/set_token_usecase.dart';
import 'package:todo_bloc/features/auth/presentation/bloc/auth_bloc.dart';

class AuthBinding {
  static AuthBloc generateBloc(BuildContext context) {
    return AuthBloc(
        sendOtpUsecase: GetIt.I<SendOtpUsecase>(),
        registerUsecase: GetIt.I<RegisterUsecase>(),
        loginUsecase: GetIt.I<LoginUsecase>(),
        setTokenUsecase: GetIt.I<SetTokenUsecase>(),
        forgotPasswordUsecase: GetIt.I<ForgotPasswordUsecase>(),
        navigator: AppNavigator(context));
  }
}
