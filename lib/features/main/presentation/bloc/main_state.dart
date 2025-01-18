part of 'main_bloc.dart';

class MainState extends Equatable {
  final ScreenType screenType;
  const MainState({this.screenType = ScreenType.task});

  MainState copyWith({ScreenType? screenType}) {
    return MainState(
      screenType: screenType ?? this.screenType,
    );
  }

  @override
  List<Object> get props => [screenType];
}
