part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class SendOtpEvent extends RegisterEvent {
  final SendOtpBody sendOtpBody;

  SendOtpEvent(this.sendOtpBody);
}

class SubmitRegisterEvent extends RegisterEvent {
  final RegisterBody registerBody;
  SubmitRegisterEvent(this.registerBody);
}
