part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class SendOtpEvent extends AuthEvent {
  final SendOtpBody sendOtpBody;

  SendOtpEvent(this.sendOtpBody);
}

class RegisterEvent extends AuthEvent {
  final RegisterEntity registerEntity;
  RegisterEvent(this.registerEntity);
}

class LoginEvent extends AuthEvent {
  final LoginBody loginBody;
  LoginEvent(this.loginBody);
}

class ForgotPasswordEvent extends AuthEvent {
  final ForgotPasswordBody forgotPasswordBody;
  ForgotPasswordEvent(this.forgotPasswordBody);
}
