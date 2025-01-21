import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:injectable/injectable.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo_bloc/config/navigation/app_navigation.dart';
import 'package:todo_bloc/config/navigation/screen_type.dart';
import 'package:todo_bloc/features/main/domain/usecases/clear_token_usecase.dart';
import 'package:todo_bloc/features/app/domain/usecase/get_token_usecase.dart';

part 'app_event.dart';
part 'app_state.dart';

@Injectable()
class AppBloc extends Bloc<AppEvent, AppState> {
  final GetTokenUsecase getTokenUsecase;
  final AppNavigator navigator;
  AppBloc(this.getTokenUsecase, this.navigator) : super(const AppState()) {
    on(onInitial);
    add(InitialAppEvent());
  }
}

extension AppBlocExtension on AppBloc {
  Future<void> onInitial(InitialAppEvent event, Emitter<AppState> emit) async {
    final token = await getTokenUsecase();
    if (token != null) {
      emit(state.copyWith(isLogin: true));
    } else {
      emit(state.copyWith(isLogin: false));
    }
  }
}
