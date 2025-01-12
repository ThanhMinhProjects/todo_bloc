import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_bloc/features/app/domain/usecase/get_token_usecase.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final GetTokenUsecase getTokenUsecase;
  AppBloc({required this.getTokenUsecase}) : super(const AppState()) {
    on(onInitial);
    add(InitialAppEvent());
  }
}

extension AppBlocExtension on AppBloc {
  Future<void> onInitial(InitialAppEvent event, Emitter<AppState> emit) async {
    final token = await getTokenUsecase();
    print('abcd$token');
    if (token != null) {
      emit(state.copyWith(isLogin: true));
    } else {
      emit(state.copyWith(isLogin: false));
    }
  }
}
