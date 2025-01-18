part of 'main_bloc.dart';

abstract class MainEvent {
  const MainEvent();
}

class SelectScreenEvent extends MainEvent {
  final ScreenType screenType;

  SelectScreenEvent(this.screenType);
}
