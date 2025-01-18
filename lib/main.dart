import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_bloc/config/di/injection.dart';
import 'package:todo_bloc/config/navigation/screen_type.dart';
import 'package:todo_bloc/core/services/share_pref_service.dart';
import 'package:todo_bloc/features/app/presentation/app.dart';
import 'package:todo_bloc/features/app/presentation/bloc/bloc/app_bloc.dart';
import 'package:todo_bloc/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:todo_bloc/features/auth/presentation/screens/login_screen.dart';
import 'package:todo_bloc/features/main/presentation/bloc/main_bloc.dart';
import 'package:todo_bloc/features/task/presentation/bloc/task_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(create: (context) => GetIt.I<AppBloc>()),
      BlocProvider(create: (context) => GetIt.I<AuthBloc>()),
      BlocProvider(create: (context) => GetIt.I<TaskBloc>()),
      BlocProvider(
        create: (context) => GetIt.I<MainBloc>(),
      )
    ], child: App()),
  );
}
