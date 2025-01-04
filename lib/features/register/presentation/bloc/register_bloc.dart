import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo_bloc/core/navigation/app_navigation.dart';
import 'package:todo_bloc/core/navigation/screen_type.dart';
import 'package:todo_bloc/core/services/body/register_body.dart';
import 'package:todo_bloc/core/services/body/send_otp_body.dart';
import 'package:todo_bloc/features/register/domain/usecases/register_usecase.dart';
import 'package:todo_bloc/features/register/domain/usecases/send_otp_usecase.dart';

part 'register_event.dart';
part 'register_state.dart';

@Injectable()
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final SendOtpUsecase sendOtpUsecase;
  final RegisterUsecase registerUsecase;
  final AppNavigator navigator;
  RegisterBloc(
      {required this.sendOtpUsecase,
      required this.registerUsecase,
      required this.navigator})
      : super(const RegisterState()) {
    on(sendOtp);
    on(register);
  }
}

extension RegisterBlocExtension on RegisterBloc {
  Future<void> sendOtp(SendOtpEvent event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await sendOtpUsecase(event.sendOtpBody);
    result.fold(
      (l) {
        emit(state.copyWith(errorMessage: l.message, isLoading: false));
        EasyLoading.showError(l.message);
      },
      (r) {
        final otp = r['code'];
        emit(state.copyWith(isLoading: false, otpMessage: otp));
        EasyLoading.showSuccess('Send OTP success');
      },
    );
  }

  Future<void> register(
      SubmitRegisterEvent event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await registerUsecase(event.registerBody);
    result.fold(
      (l) {
        emit(state.copyWith(errorMessage: l.message, isLoading: false));
        EasyLoading.showError(l.message);
      },
      (r) {
        switch (r['message']) {
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
                transitionType: PageTransitionType.leftToRight);
        }
      },
    );
  }
}
