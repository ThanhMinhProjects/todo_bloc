import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:todo_bloc/core/services/body/register_body.dart';
import 'package:todo_bloc/core/services/body/send_otp_body.dart';
import 'package:todo_bloc/features/register/domain/usecases/send_otp_usecase.dart';

part 'register_event.dart';
part 'register_state.dart';

@injectable
class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final SendOtpUsecase sendOtpUsecase;
  RegisterBloc({required this.sendOtpUsecase}) : super(const RegisterState()) {
    on(sendOtp);
  }
}

extension RegisterBlocExtension on RegisterBloc {
  Future<void> sendOtp(SendOtpEvent event, Emitter<RegisterState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await sendOtpUsecase(event.sendOtpBody);
    result.fold(
      (failure) =>
          emit(state.copyWith(errorMessage: failure.message, isLoading: false)),
      (result) => emit(state.copyWith(otpMessage: result, isLoading: false)),
    );
  }
}
