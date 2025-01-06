part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class SendOtpEvent extends AuthEvent {
  final SendOtpBody sendOtpBody;

  SendOtpEvent(this.sendOtpBody);
}

class RegisterEvent extends AuthEvent {
  final RegisterBody registerBody;
  RegisterEvent(this.registerBody);
}

class LoginEvent extends AuthEvent {
  final LoginBody loginBody;
  LoginEvent(this.loginBody);
}
