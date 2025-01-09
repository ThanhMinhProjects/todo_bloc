import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:injectable/injectable.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo_bloc/config/navigation/app_navigation.dart';
import 'package:todo_bloc/config/navigation/screen_type.dart';
import 'package:todo_bloc/features/auth/data/datasources/body/forgot_password_body.dart';
import 'package:todo_bloc/features/auth/data/datasources/body/login_body.dart';
import 'package:todo_bloc/features/auth/data/datasources/body/register_body.dart';
import 'package:todo_bloc/features/auth/data/datasources/body/send_otp_body.dart';
import 'package:todo_bloc/features/auth/domain/entities/register_entity.dart';
import 'package:todo_bloc/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:todo_bloc/features/auth/domain/usecases/login_usecase.dart';
import 'package:todo_bloc/features/auth/domain/usecases/register_usecase.dart';
import 'package:todo_bloc/features/auth/domain/usecases/send_otp_usecase.dart';
import 'package:todo_bloc/features/auth/domain/usecases/set_token_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@Injectable()
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SendOtpUsecase sendOtpUsecase;
  final RegisterUsecase registerUsecase;
  final LoginUsecase loginUsecase;
  final ForgotPasswordUsecase forgotPasswordUsecase;
  final SetTokenUsecase setTokenUsecase;
  final AppNavigator navigator;
  AuthBloc(
      {required this.sendOtpUsecase,
      required this.registerUsecase,
      required this.loginUsecase,
      required this.setTokenUsecase,
      required this.forgotPasswordUsecase,
      required this.navigator})
      : super(const AuthState()) {
    on(sendOtp);
    on(register);
    on(login);
    on(forgotPassword);
  }
}

extension RegisterBlocExtension on AuthBloc {
  Future<void> sendOtp(SendOtpEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await sendOtpUsecase(event.sendOtpBody);
    result.fold(
      (l) {
        emit(state.copyWith(errorMessage: l.message, isLoading: false));
        EasyLoading.showError(l.message);
      },
      (r) {
        final otp = r.code;
        emit(state.copyWith(isLoading: false, otpMessage: otp));
        EasyLoading.showSuccess('sendOtp: ${r.code}');
      },
    );
  }

  Future<void> register(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await registerUsecase(event.registerBody);
    result.fold(
      (l) {
        emit(state.copyWith(errorMessage: l.message, isLoading: false));
        EasyLoading.showError(l.message);
      },
      (r) {
        switch (r.message) {
          case 'USER_EXISTED':
            EasyLoading.showError('User existed');
            break;
          case 'WRONG_OTP':
            EasyLoading.showError('Wrong otp');
            break;
          default:
            emit(state.copyWith(isLoading: false));
            EasyLoading.showSuccess('success');
            navigator.pushAndRemoveUntil(
                screenType: ScreenType.login,
                transitionType: PageTransitionType.leftToRight,
                arguments: event.registerBody.email);
        }
      },
    );
  }

  Future<void> login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoading: true));

    final result = await loginUsecase(event.loginBody);
    result.fold(
      (l) {
        emit(state.copyWith(errorMessage: l.message, isLoading: false));
        EasyLoading.showError(l.message);
      },
      (r) async {
        emit(state.copyWith(isLoading: false));
        switch (r.message) {
          case 'USER_NOT_EXIST':
            EasyLoading.showError('User not exist!');
            break;
          case 'WRONG_PASSWORD':
            EasyLoading.showError('Wrong password!');
            break;
          default:
            EasyLoading.showSuccess('Login success');
            final token = r.token;
            await setTokenUsecase(token!);
            navigator.push(screenType: ScreenType.task);
        }
      },
    );
  }

  Future<void> forgotPassword(
      ForgotPasswordEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await forgotPasswordUsecase(event.forgotPasswordBody);
    emit(state.copyWith(isLoading: false));
    result.fold(
      (l) {
        EasyLoading.showError(l.message);
      },
      (r) {
        emit(state.copyWith(isLoading: false));
        switch (r.message) {
          case 'USER_NOT_EXIST':
            EasyLoading.showError('User not exist!');
            break;
          case 'WRONG_PASSWORD':
            EasyLoading.showError('Wrong password!');
            break;
          default:
            EasyLoading.showSuccess('Forgot password success');
            navigator.push(
                screenType: ScreenType.login,
                arguments: event.forgotPasswordBody.email);
        }
      },
    );
  }
}
