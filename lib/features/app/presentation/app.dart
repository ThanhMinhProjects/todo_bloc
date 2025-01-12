import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_bloc/config/navigation/screen_type.dart';
import 'package:todo_bloc/features/app/presentation/binding/app_binding.dart';
import 'package:todo_bloc/features/app/presentation/bloc/bloc/app_bloc.dart';
import 'package:todo_bloc/features/auth/presentation/bloc/auth_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: AppBinding.generateBloc,
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: ScreenTypeHelper.getPage(
                state.isLogin ? ScreenType.task : ScreenType.login),
            builder: EasyLoading.init(),
          );
        },
      ),
    );
  }
}
