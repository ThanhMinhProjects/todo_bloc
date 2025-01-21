import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:injectable/injectable.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo_bloc/config/navigation/app_navigation.dart';
import 'package:todo_bloc/config/navigation/screen_type.dart';
import 'package:todo_bloc/features/main/domain/usecases/clear_token_usecase.dart';

part 'main_event.dart';
part 'main_state.dart';

@Injectable()
class MainBloc extends Bloc<MainEvent, MainState> {
  final ClearTokenUsecase clearTokenUsecase;
  final AppNavigator navigator;
  MainBloc(this.clearTokenUsecase, this.navigator) : super(const MainState()) {
    on(onSelectPage);
    on(onLogout);
  }
}

extension MainBlocExtension on MainBloc {
  void onSelectPage(SelectScreenEvent event, Emitter<MainState> emit) {
    emit(state.copyWith(screenType: event.screenType));
  }

  Future<void> onLogout(LogoutEvent event, Emitter<MainState> emit) async {
    final loggedOut = await clearTokenUsecase();
    if (loggedOut) {
      navigator.pushAndRemoveUntil(
          screenType: ScreenType.login,
          arguments: event.email,
          transitionType: PageTransitionType.leftToRight);
    } else {
      EasyLoading.showError('Logout error!!!');
    }
  }
}
