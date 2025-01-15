part of 'app_bloc.dart';

abstract class AppEvent {}

class InitialAppEvent extends AppEvent {
  InitialAppEvent();
}

class LogoutEvent extends AppEvent {
  final String email;

  LogoutEvent(this.email);
}
