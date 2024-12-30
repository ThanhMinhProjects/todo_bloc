import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo_bloc/core/services/body/register_body.dart';
import 'package:todo_bloc/core/services/body/send_otp_body.dart';
import 'package:todo_bloc/features/register/domain/usecases/send_otp_usecase.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final SendOtpUsecase sendOtpUsecase;
  RegisterBloc({required this.sendOtpUsecase}) : super(RegisterInitial()) {
    on<SendOtpEvent>(sendOtp);
  }
}

extension RegisterBlocExtension on RegisterBloc {
  Future<void> sendOtp(SendOtpEvent event, Emitter<RegisterState> emit) async {
    emit(IsLoading(true));
    String result = await sendOtpUsecase(event.sendOtpBody);
    print('registerResult$result');
  }
}
