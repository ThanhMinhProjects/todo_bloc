import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_bloc/config/navigation/app_navigation.dart';
import 'package:todo_bloc/features/app/domain/usecase/get_token_usecase.dart';
import 'package:todo_bloc/features/app/presentation/bloc/bloc/app_bloc.dart';

class AppBinding {
  static AppBloc generateBloc(BuildContext context) {
    return AppBloc(getTokenUsecase: GetIt.I<GetTokenUsecase>());
  }
}
