import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_bloc/config/navigation/screen_type.dart';
import 'package:todo_bloc/core/constants/app_color.dart';
import 'package:todo_bloc/features/app/presentation/bloc/bloc/app_bloc.dart';
import 'package:todo_bloc/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:todo_bloc/gen/assets.gen.dart';
import 'package:todo_bloc/gen/fonts.gen.dart';

class App extends StatelessWidget {
  App({super.key});
  final navigatorKey = GetIt.I<GlobalKey<NavigatorState>>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColor.backgroundColor,
            appBarTheme:
                const AppBarTheme(backgroundColor: AppColor.backgroundColor),
            primaryColor: AppColor.primaryColor,
            fontFamily: FontFamily.varelaRoundRegular,
          ),
          home: ScreenTypeHelper.getPage(
              state.isLogin ? ScreenType.main : ScreenType.login),
          builder: EasyLoading.init(),
        );
      },
    );
  }
}
