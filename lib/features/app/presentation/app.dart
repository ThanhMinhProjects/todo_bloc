import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_bloc/core/navigation/screen_type.dart';
import 'package:todo_bloc/features/app/presentation/bloc/bloc/app_bloc.dart';
import 'package:todo_bloc/features/auth/presentation/bloc/auth_bloc.dart';

class App extends StatelessWidget {
  App({super.key});
  final navigatorKey = GetIt.I<GlobalKey<NavigatorState>>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<AppBloc>(),
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return MaterialApp(
            navigatorKey: navigatorKey,
            home: ScreenTypeHelper.getPage(
                state.isLogin ? ScreenType.todo : ScreenType.login),
            builder: EasyLoading.init(),
          );
        },
      ),
    );
  }
}
