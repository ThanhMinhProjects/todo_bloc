import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_bloc/config/navigation/screen_type.dart';

part 'main_event.dart';
part 'main_state.dart';

@Injectable()
class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainState()) {
    on(onSelectPage);
  }
}

extension MainBlocExtension on MainBloc {
  void onSelectPage(SelectScreenEvent event, Emitter<MainState> emit) {
    emit(state.copyWith(screenType: event.screenType));
  }
}
