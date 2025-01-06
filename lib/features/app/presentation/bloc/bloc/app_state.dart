part of 'app_bloc.dart';

class AppState extends Equatable {
  final bool isLogin;
  const AppState({this.isLogin = false});

  AppState copyWith({
    bool? isLogin,
  }) {
    return AppState(isLogin: isLogin ?? this.isLogin);
  }

  @override
  List<Object?> get props => [isLogin];
}
