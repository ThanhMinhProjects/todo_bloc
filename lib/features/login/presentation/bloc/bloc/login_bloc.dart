import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_bloc/core/navigation/app_navigation.dart';
import 'package:todo_bloc/core/navigation/screen_type.dart';

part 'login_event.dart';
part 'login_state.dart';

@Injectable()
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AppNavigator navigator;
  LoginBloc(this.navigator) : super(const LoginState()) {
    on(gotoRegister);
  }
}

extension LoginBlocExtension on LoginBloc {
  Future<void> gotoRegister(
      GotoRegisterEvent event, Emitter<LoginState> emit) async {
    navigator.push(screenType: ScreenType.register);
  }
}
